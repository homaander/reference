module Responce where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)

data Responce = Responce {
    respError   :: Int
  , respMessage :: String
  , respData    :: String
  }
    deriving (Show, Generic)

instance ToJSON Responce
instance FromJSON Responce

respOk :: Responce
respOk = Responce 0 "Ok" ""

respDefault :: String -> Responce
respDefault = Responce 0 "Ok"