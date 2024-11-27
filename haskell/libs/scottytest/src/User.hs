module User (User(..), addUser) where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import Database.SQLite.Simple
import Data.Time


import DBInit (withConn)



data User = User {
    userName     :: String
  , userPassword :: String
  }
    deriving (Show, Generic)

instance ToJSON User
instance FromJSON User

addUser :: User -> IO Int
addUser user = do
  let
    user_name = userName user
    user_pass = userPassword user

  user_id <- withConn $ \conn -> do
    execute conn
      "INSERT INTO users (username, userpass) VALUES (?, ?)"
      (user_name, user_pass)

    datetime <- getCurrentTime
    putStrLn $ show datetime <> "| User success added"

    lastInsertRowId conn

  pure $ fromIntegral user_id

