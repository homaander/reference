module DBInit (withConn) where

import Database.SQLite.Simple

dbPath :: String
dbPath = "db/main.db"

withConn :: (Connection -> IO a) -> IO a
withConn action = do
  conn <- open dbPath
  resp <- action conn
  close conn
  return resp
