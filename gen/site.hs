--------------------------------------------------------------------------------
{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid           (mappend)
import           Hakyll

import qualified Data.Time             as Time

import qualified System.Directory      as Dir
import qualified System.FilePath       as FP
import           Text.Pandoc           (ReaderOptions (..), WriterOptions (..))
import qualified Text.Pandoc
import qualified Text.Pandoc.Shared

import           Data.Functor.Identity (runIdentity)
import           Data.String           (fromString)
import           Data.Text             (Text)
import qualified Data.Text             as T

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


-- from: https://svejcar.dev/posts/2019/11/27/table-of-contents-in-hakyll/
withTOC :: WriterOptions
withTOC = defaultHakyllWriterOptions
          { -- writerNumberSections  = True
          -- ,
            writerTableOfContents = True,
            writerTOCDepth        = 3,
            writerTemplate        = Just tocTemplate
        }

tocTemplate :: Text.Pandoc.Template Text
tocTemplate = either error id . runIdentity . Text.Pandoc.compileTemplate "" $ T.unlines
  [ "<div class=\"toc\">"
  , "$toc$"
  , "</div>"
  , "$body$"
  ]

data ParseBN = W Int | Q Int

getWeekNumber :: ParseBN -> Int
getWeekNumber (W i) = i
getWeekNumber (Q i) = i

rstCompilingRule :: Compiler (Item String)
rstCompilingRule = do
--  loadBody "templates/nav.html" :: Compiler Template

  underlying <- getUnderlying
  toc        <- getMetadataField underlying "tableOfContents"
  let wopt = case toc of
               Just "true" -> withTOC
               _           -> defaultHakyllWriterOptions

  fp <- getResourceFilePath
  mt <- getItemModificationTime underlying

  let lastModified =
        Time.formatTime
          Time.defaultTimeLocale
          "%Y-%m-%d %H:%M:%S"
          (Time.utcToLocalTime (Time.TimeZone (9 * 60) False "JST") mt)

  let ctxt =
        constField "lastModified" lastModified <>
        defaultContext

  let bn = FP.takeBaseName fp
  case checkBN bn of
    Just (Q i) -> do
      inst <-
        if i <= 4 then loadBody "questions/instruction.rst"
        else           loadBody "questions/eto_instruction.rst"

      let ctxt' =
            constField "instruction" inst     <>
            constField "number"      (show i) <>
            ctxt

      pandocCompilerWithTransform defaultHakyllReaderOptions wopt (Text.Pandoc.Shared.headerShift 1)
        >>= loadAndApplyTemplate "templates/defaultQ.html" ctxt'
        >>= relativizeUrls

    Just (W i) -> do
      let ctxt' =
            constField "number"      (show i) <>
            ctxt

      pandocCompilerWithTransform defaultHakyllReaderOptions wopt (Text.Pandoc.Shared.headerShift 1)
        >>= loadAndApplyTemplate "templates/defaultW.html" ctxt'
        >>= relativizeUrls


    Nothing -> do
      let tmpl =
            if "setup" `Data.List.isPrefixOf` bn then
              "templates/defaultSetup.html"
            else
              "templates/default.html"
      pandocCompilerWithTransform defaultHakyllReaderOptions wopt (Text.Pandoc.Shared.headerShift 1)
        >>= loadAndApplyTemplate tmpl ctxt
        >>= relativizeUrls
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
      compile $ pandocCompilerWithTransform defaultHakyllReaderOptions defaultHakyllWriterOptions (Text.Pandoc.Shared.headerShift 1)


    match "pages/*.md" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile rstCompilingRule

    match "pages/*.rst" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile rstCompilingRule

    match "pages/*.html" $ do
      route $ gsubRoute "pages/" (const "")
      compile $
        getResourceBody
        >>= relativizeUrls


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
            >>= relativizeUrls



--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
