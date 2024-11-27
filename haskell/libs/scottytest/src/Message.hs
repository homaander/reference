module Message where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import Database.SQLite.Simple

import Responce
import User

data SendForm = SendForm {
    sendSessionKey :: String
  , sendMessage    :: String
  }
    deriving (Show, Generic)

instance ToJSON SendForm
instance FromJSON SendForm

send :: SendForm -> IO Responce
send sendForm = do
    let
        session_key = sendSessionKey sendForm
        message     = sendMessage sendForm
    pure $ Responce 0 "" ""