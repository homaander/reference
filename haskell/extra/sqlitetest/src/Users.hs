module Users where

import MainDB
import Database.SQLite.Simple

data User = User { userId :: Int
                 , userName :: String }
  deriving Show

instance FromRow User where
  fromRow = User <$> field <*> field

addUser :: String -> IO ()
addUser user = 
  withConn "databases/main.db" $
    \conn -> do
      execute conn "INSERT INTO users (username) VALUES (?)" (Only user)
      putStrLn "Success added"

printUsers :: IO ()
printUsers = 
  withConn "databases/main.db" $
    \conn -> do
      resp <- query_ conn "SELECT * FROM users;" :: IO [User]
      mapM_ print resp