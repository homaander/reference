module MainDB (withConn, firstOrNothing) where

import Database.SQLite.Simple

withConn :: String -> (Connection -> IO ()) -> IO ()
withConn dbName action = do
  conn <- open dbName
  action conn
  close conn

firstOrNothing :: [a] -> Maybe a
firstOrNothing []    = Nothing
firstOrNothing (x:_) = Just x
