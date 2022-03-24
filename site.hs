--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid           (mappend)
import           Hakyll

import           Text.Pandoc

import           Data.Functor.Identity (runIdentity)
import           Data.Text             (Text)
import qualified Data.Text             as T

-- import qualified Debug.Trace

conf :: Configuration
conf = defaultConfiguration
       {
         providerDirectory = "./websrc"
       }


-- from: https://svejcar.dev/posts/2019/11/27/table-of-contents-in-hakyll/
withTOC :: WriterOptions
withTOC = defaultHakyllWriterOptions
          { -- writerNumberSections  = True
          -- ,
            writerTableOfContents = True,
            writerTOCDepth        = 2,
            writerTemplate        = Just tocTemplate
        }

tocTemplate :: Text.Pandoc.Template Text
tocTemplate = either error id . runIdentity . compileTemplate "" $ T.unlines
  [ "<div class=\"toc\">"
  , "$toc$"
  , "</div>"
  , "$body$"
  ]


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


    match "pages/*.md" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile $ do
        underlying <- getUnderlying
        toc        <- getMetadataField underlying "tableOfContents"
        let wopt = case toc of
                     Just "true" -> withTOC
                     _           -> defaultHakyllWriterOptions
        pandocCompilerWith defaultHakyllReaderOptions wopt
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls

    match "pages/*.rst" $ do
      route $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
      compile $ do
        underlying <- getUnderlying
        toc        <- getMetadataField underlying "tableOfContents"
        let wopt = case toc of
                     Just "true" -> withTOC
                     _           -> defaultHakyllWriterOptions
        pandocCompilerWith defaultHakyllReaderOptions wopt
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls
      -- compile $ pandocCompiler
      --   >>= loadAndApplyTemplate "templates/default.html" defaultContext
      --   >>= relativizeUrls

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
--            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx = defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
