module Auth where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import System.Random
import Database.SQLite.Simple
import Data.Time

import DBInit (withConn)
import User
import Responce


data AuthForm = AuthForm {
    authUsername :: String
  , authPassword :: String
  }
    deriving (Show, Generic)

instance ToJSON AuthForm
instance FromJSON AuthForm

data RegForm = RegForm {
    regUsername  :: String
  , regPassword  :: String
  , regSPassword :: String
  }
    deriving (Show, Generic)

instance ToJSON RegForm
instance FromJSON RegForm

register :: RegForm -> IO Responce
register regForm = do
  let
    username  = regUsername regForm
    password  = regPassword regForm
    spassword = regSPassword regForm

  if password /= spassword
    then pure $ Responce 1 "Пароли не совпадают" ""
    else do
      uid <- addUser $ User username password
      session_key <- genSessionID uid
      pure $ Responce 0 "" $ "{'session_key':'" <> session_key <> "'}"

genSessionID :: Int -> IO String
genSessionID uid = do
  session_seed <- getStdRandom random :: IO Int

  -- ! Huihya, nado SHA1
  let session_key = show session_seed

  withConn $ \conn -> do
    execute conn
      "INSERT INTO session_ids (owner_id, session_key) VALUES (?, ?)"
      (uid, session_key)

    datetime <- getCurrentTime
    putStrLn $ show datetime <> "| Session success added"

  return session_key