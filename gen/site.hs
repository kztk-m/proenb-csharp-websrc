--------------------------------------------------------------------------------
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid           (mappend)
import           Hakyll

import qualified Data.Time             as Time

import qualified System.Directory      as Dir
import qualified System.FilePath       as FP
import qualified Text.Pandoc           as P
import           Text.Pandoc           (ReaderOptions (..), WriterOptions (..))
import qualified Text.Pandoc.Shared
import qualified Text.Pandoc.Walk      as P

import qualified Data.Char
import           Data.Functor.Identity (runIdentity)
import           Data.String           (fromString)
import           Data.Text             (Text)
import qualified Data.Text             as T

import           Control.Category      ((>>>))
import qualified Data.List             (isPrefixOf)

-- import qualified Debug.Trace

conf :: Configuration
conf = defaultConfiguration
       {
         deployCommand = "cd .. && sh ./deploy.sh",
         providerDirectory = "../websrc",
         destinationDirectory = "../_site",
         storeDirectory       = "../_cache",
         tmpDirectory         = "../_cache/tmp"
       }

myReaderOptions :: ReaderOptions
myReaderOptions =
  defaultHakyllReaderOptions
  {
    -- No smart quotes
    readerExtensions = P.disableExtension P.Ext_smart (readerExtensions defaultHakyllReaderOptions),
    readerColumns = 10000 -- suppress Markdown to determine the proportion of table columns
  }

myWriterOptions :: WriterOptions
myWriterOptions =
  defaultHakyllWriterOptions
  {
    writerExtensions = P.disableExtension P.Ext_smart (writerExtensions defaultHakyllWriterOptions), 
    writerSectionDivs = True 
  }

-- from: https://svejcar.dev/posts/2019/11/27/table-of-contents-in-hakyll/
withTOC :: WriterOptions
withTOC = myWriterOptions
          { -- writerNumberSections  = True
          -- ,
            writerTableOfContents = True,
            writerTOCDepth        = 3,
            writerTemplate        = Just tocTemplate
          }

tocTemplate :: P.Template Text
tocTemplate = either error id . runIdentity . P.compileTemplate "" $ T.unlines
  [ "<nav class=\"toc\">"
  , "$toc$"
  , "</nav>"
  , "<section class=\"mainbody\">$body$</section>"
  ]

data ParseBN = W Int | Q Int

getWeekNumber :: ParseBN -> Int
getWeekNumber (W i) = i
getWeekNumber (Q i) = i

adjustJapaneseSpacing :: Item String -> Compiler (Item String)
adjustJapaneseSpacing = pure . fmap aj
  where
    isJpChar :: Char -> Bool
    isJpChar c = isJpPunct || isKana || isFWRomanAndHWKana || isKanji
      where
        cp = Data.Char.ord c
        -- see https://stackoverflow.com/questions/19899554/unicode-range-for-japanese
        isJpPunct = 0x3000 <= cp && cp <= 0x303f
        isKana = 0x3040 <= cp && cp <= 0x30ff
        isFWRomanAndHWKana = 0xff00 <= cp && cp <= 0xffef
        isKanji = 0x4e00 <= cp && cp <= 0x9faf

    aj :: String -> String
    aj [] = []
    aj ('<':'/':'e':'m':'>':sp:c:cs) | Data.Char.isSpace sp && isJpChar c = "</em>" ++ aj (c:cs)
    aj ('<':'/':'a':'>':sp:c:cs) | Data.Char.isSpace sp && isJpChar c = "</a>" ++ aj (c:cs)
    aj ('<':'/':'s':'t':'r':'o':'n':'g':'>':sp:c:cs) | Data.Char.isSpace sp && isJpChar c = "</strong>" ++ aj (c:cs)
    aj ('<':'p':'r':'e':cs) = "<pre" ++ ajPre cs
    aj (c:cs)
     | isJpChar c = ajAfterJp c cs
     | otherwise  = c:aj cs

    ajPre []                           = []
    ajPre ('<':'/':'p':'r':'e':'>':cs) = "</pre>" ++ aj cs
    ajPre (c:cs)                       = c:ajPre cs

    ajAfterJp :: Char -> String -> String
    ajAfterJp jc [] = [jc]
    ajAfterJp jc ('\n':cs) | Just rest <- skipTrailingNBSPBeforeJp cs = jc:aj rest
    ajAfterJp jc (' ':'<':cs) | "a " `Data.List.isPrefixOf` cs || "strong" `Data.List.isPrefixOf` cs || "em" `Data.List.isPrefixOf` cs = jc:"<"++aj cs
    ajAfterJp jc (c:cs) = jc:aj(c:cs)

    skipTrailingNBSPBeforeJp :: String -> Maybe String
    skipTrailingNBSPBeforeJp [] = Just []
    skipTrailingNBSPBeforeJp ('\n':cs) = Nothing
    skipTrailingNBSPBeforeJp ('\r':cs) = Nothing
    skipTrailingNBSPBeforeJp (c:cs)
     | Data.Char.isSpace c = skipTrailingNBSPBeforeJp cs
     | isJpChar c = Just (c:cs)
     | otherwise = Nothing

procMarkdownAdmonitions :: P.Pandoc -> P.Pandoc
procMarkdownAdmonitions = P.walk go
  where
    splitAtSoftbreak :: [P.Inline] -> ([P.Inline],[P.Inline])
    splitAtSoftbreak [] = ([], [])
    splitAtSoftbreak (i:is) = case i of
      P.SoftBreak -> ([], is)
      _           -> let (s, t) = splitAtSoftbreak is in (i:s, t)

    go :: P.Block -> P.Block
    go b@(P.BlockQuote (P.Para para:bs2)) -- too specific?
      | ([P.Str "[!NOTE]"],bs1) <- splitAtSoftbreak para = mkDiv "note" "Note" (P.Para bs1 : bs2)
      | ([P.Str "[!TIP]"],bs1) <- splitAtSoftbreak para = mkDiv "tip" "Tip" (P.Para bs1 : bs2)
      | ([P.Str "[!CAUTION]"],bs1) <- splitAtSoftbreak para= mkDiv "caution" "Caution" (P.Para bs1 : bs2)
      | ([P.Str "[!IMPORTANT]"],bs1) <- splitAtSoftbreak para = mkDiv "important" "Important" (P.Para bs1 : bs2)
      | ([P.Str "[!WARNING]"],bs1) <- splitAtSoftbreak para = mkDiv "warning" "Warning" (P.Para bs1 : bs2)
      where
        mkDiv c t bs = P.Div ("",[c],[]) $ P.Div ("",["title"],[]) [P.Para [P.Str t]] : bs
    go b                                      = b

myTransformM :: P.Pandoc -> Compiler P.Pandoc
myTransformM d = do
  let d' = Text.Pandoc.Shared.headerShift 1 d
  isMarkdown <- (== ".md") <$> getUnderlyingExtension
  if isMarkdown
    then pure $ procMarkdownAdmonitions d'
    else pure d'


pageCompilingRule :: Compiler (Item String)
pageCompilingRule = do
--  loadBody "templates/nav.html" :: Compiler Template

  underlying <- getUnderlying
  toc        <- getMetadataField underlying "tableOfContents"
  let wopt = case toc of
               Just "true" -> withTOC
               _           -> myWriterOptions

  fp <- getResourceFilePath
  mt <- getItemModificationTime underlying

  let formatTimeAsJST utc =
        Time.formatTime
          Time.defaultTimeLocale
          "%Y-%m-%d %H:%M:%S"
          (Time.utcToLocalTime (Time.TimeZone (9 * 60) False "JST") utc)

  let ctxt =
        constField "lastModified" (formatTimeAsJST mt) <>
        defaultContext

  let bn = FP.takeBaseName fp
  let postProc a = relativizeUrls a >>= adjustJapaneseSpacing

  case checkBN bn of
    Just (Q i) -> do
      inst <-
        if i <= 4 then load "questions/instruction.md"
        else           load "questions/eto_instruction.md"

      mti <- getItemModificationTime (itemIdentifier inst)

      let ctxt' =
            constField "instruction" (itemBody inst) <>
            constField "number"      (show i) <>
            constField "lastModified" (formatTimeAsJST $ max mt mti) <> -- update lastModified
            ctxt

      pandocCompilerWithTransformM myReaderOptions wopt myTransformM
        >>= loadAndApplyTemplate "templates/defaultQ.html" ctxt'
        >>= postProc

    Just (W i) -> do
      let ctxt' =
            constField "number"      (show i) <>
            ctxt

      pandocCompilerWithTransformM myReaderOptions wopt myTransformM
        >>= loadAndApplyTemplate "templates/defaultW.html" ctxt'
        >>= postProc


    Nothing -> do
      let tmpl =
            if "setup" `Data.List.isPrefixOf` bn then
              "templates/defaultSetup.html"
            else
              "templates/default.html"
      pandocCompilerWithTransformM myReaderOptions wopt myTransformM
        >>= loadAndApplyTemplate tmpl ctxt
        >>= postProc
  where
    checkBN :: String -> Maybe ParseBN
    checkBN (c:s) =
      case [ n | (n, []) <- reads s ] of
        [n] ->
          if | c == 'w'  -> Just (W n)
             | c == 'q'  -> Just (Q n)
             | otherwise -> Nothing
        _   -> Nothing
    checkBN _ = Nothing



--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith conf $ do
    match "images/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "files/**" $ do 
        route $ gsubRoute "files/" (const "")
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "js/*" $ do
      route idRoute
      compile copyFileCompiler

    match "templates/*" $
      compile $ do
        templateBodyCompiler

    match "questions/*" $ do
      compile $ pandocCompilerWithTransformM myReaderOptions myWriterOptions myTransformM

    match "pages/*.md" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile pageCompilingRule

    match "pages/*.rst" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile pageCompilingRule

    match "pages/*.html" $ do
      route $ gsubRoute "pages/" (const "")
      compile $
        getResourceBody
        >>= relativizeUrls >>= adjustJapaneseSpacing


    -- match (fromList ["about.rst", "contact.markdown"]) $ do
    --     route   $ setExtension "html"
    --     compile $ pandocCompiler
    --         >>= loadAndApplyTemplate "templates/default.html" defaultContext
    --         >>= relativizeUrls

    -- match "posts/*" $ do
    --     route $ setExtension "html"
    --     compile $ pandocCompiler
    --         >>= loadAndApplyTemplate "templates/post.html"    postCtx
    --         >>= loadAndApplyTemplate "templates/default.html" postCtx
    --         >>= relativizeUrls

    -- create ["archive.html"] $ do
    --     route idRoute
    --     compile $ do
    --         posts <- recentFirst =<< loadAll "posts/*"
    --         let archiveCtx =
    --                 listField "posts" postCtx (return posts) `mappend`
    --                 constField "title" "Archives"            `mappend`
    --                 defaultContext

    --         makeItem ""
    --             >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
    --             >>= loadAndApplyTemplate "templates/default.html" archiveCtx
    --             >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
--          loadBody "templates/nav.html" :: Compiler Template
--            posts <- recentFirst =<< loadAll "posts/*"
          let indexCtx = defaultContext

          getResourceBody
            >>= applyAsTemplate indexCtx
            >>= loadAndApplyTemplate "templates/default.html" indexCtx
            >>= relativizeUrls >>= adjustJapaneseSpacing



--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
