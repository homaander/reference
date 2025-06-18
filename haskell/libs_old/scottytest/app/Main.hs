{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Web.Scotty
import Network.Wai.Handler.Warp

import Data.Text.Lazy (Text)
import Data.Aeson (encode, decode)

import User (User(..), addUser)
import Auth
import Responce
import Message


opts :: Options
opts = Options 1 $ (
    -- setHost "0.0.0.0" 
    setHost "127.0.0.1" 
  . setPort 3000
  ) defaultSettings

main :: IO ()
main = scottyOpts opts $ do
  post "/register" $ do
    regForm <- jsonData :: ActionM RegForm
    resp <- liftIO $ register regForm
    json resp

  post "/send" $ do
    sendForm <- jsonData :: ActionM SendForm
    resp <- liftIO $ send sendForm
    json resp

  get "/" $ do
    html $ baseHTML "Main" [
      "<h1>" <> "Scotty, Index me up!" <> "</h1>"
      ]

baseHTML :: Text -> [Text] -> Text
baseHTML title tags = mconcat [
    "<!DOCTYPE html>"
  , "<html>"
  , "  <head>"
  , "    <title>" <> title <> "</title>"
  , "  </head>"
  , "  <body>"
  ,      mconcat tags
  , "  </body>"
  , "</html>"
  ]