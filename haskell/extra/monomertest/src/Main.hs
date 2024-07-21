{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Control.Lens
import Data.Maybe ()
import Data.Text  (Text)
import TextShow   (TextShow(showt))
import Monomer
import qualified Monomer.Lens as L



data AppModel = AppModel {
      _clickCount :: Int
    , _hps        :: Int
    , _message    :: Text
    }
  deriving (Eq, Show)

makeLenses 'AppModel

data AppEvent = AppInit
              | AppIncrease
              | AppAddHP Int
  deriving (Eq, Show)

type WidgetEnv'    = WidgetEnv AppModel AppEvent
type WidgetNode'   = WidgetNode AppModel AppEvent
type AppEventResp' = AppEventResponse AppModel AppEvent



buildUI :: WidgetEnv' -> AppModel -> WidgetNode'
buildUI wenv model = widgetTreeS
  where
    widgetTreeS = styleBasic widgetTree' [
        padding 10
      ]

    widgetTree' = vstack [
        label_ (model ^. message) [multiline]
      , spacer

      , hstack [
            vstack [
                label $ "Clicks: " <> showt (model^.clickCount)
              , spacer
              , button "+ CLICK +" AppIncrease
              ]

          , spacer

          , vstack [
                label $ "HP: " <> showt (model^.hps)
              , spacer
              , button "+ HP +"  $ AppAddHP 10
              ]
          ]

      , spacer
      , textArea message
      , spacer

      , image "./assets/images/bg.jpg"
      ]



handleEvent :: WidgetEnv' -> WidgetNode' -> AppModel -> AppEvent -> [AppEventResp']
handleEvent wenv node model evt = case evt of
  AppInit     -> []
  AppIncrease -> [Model (model & clickCount +~ 1)]
  AppAddHP x  -> [Model (model & addHP x)]

addHP :: Int -> AppModel -> AppModel
addHP x m = (hps +~ (m ^. clickCount)) m

-- addHP :: Int -> AppModel -> AppModel
-- addHP x = w $ (hps +~) . (^. clickCount)
--   where
--     w f a = f a a



title :: Text
title  = "My App"

main :: IO ()
main = do
    startApp model handleEvent buildUI config
  where
    model = AppModel 0 0 ""
    config = [
        appWindowTitle title
      , appWindowIcon "./assets/images/icon.png"
      , appTheme darkTheme
      , appFontDef "Regular" "./assets/fonts/Roboto-Regular.ttf"
      , appInitEvent AppInit
      ]
