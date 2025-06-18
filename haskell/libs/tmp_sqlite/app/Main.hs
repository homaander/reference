module Main where

import Data.Time
import Database.SQLite.Simple

withConn :: String -> (Connection -> IO ()) -> IO ()
withConn dbName action = do
  conn <- open dbName
  action conn
  close conn

firstOrNothing :: [a] -> Maybe a
firstOrNothing []    = Nothing
firstOrNothing (x:_) = Just x

data Tool = Tool { toolId :: Int
                 , toolName :: String
                 , toolDescription :: String
                 , lastReturned :: Day
                 , timesBorrowed :: Int }
                   deriving Show

instance FromRow Tool where
  fromRow = Tool <$> field <*> field <*> field <*> field <*> field

addTool :: String -> String -> IO ()
addTool name description =
  withConn "databases/main.db" $
    \conn -> do
      day <- utctDay <$> getCurrentTime
      let q = mconcat [ "INSERT INTO tools"
                      , "(name, description, lastReturned, timesBorrowed)"
                      , "VALUES (?, ?, ?, 0)" ]
      execute conn q (name, description, day)
      putStrLn "Success added"

printToolQuery :: Query -> IO ()
printToolQuery q =
  withConn "databases/main.db" $
    \conn -> do
      resp  <- query_ conn q :: IO [Tool]
      mapM_ print resp

printTools, printToolsAvailable, printToolsCheckedout :: IO ()

printTools = printToolQuery 
  "SELECT * FROM tools;"
printToolsAvailable = printToolQuery
  "SELECT * FROM tools WHERE id NOT IN (SELECT tool_id FROM checkedout);"
printToolsCheckedout = printToolQuery
  "SELECT * FROM tools WHERE id IN (SELECT tool_id FROM checkedout);"

selectTool :: Connection -> Int -> IO (Maybe Tool)
selectTool conn tid = do
  resp <- query conn "SELECT * FROM tools WHERE id = (?)" (Only tid)
  return $ firstOrNothing resp

getUpdateTool :: Tool -> Day -> Tool
getUpdateTool tool day = tool 
  { lastReturned  = day
  , timesBorrowed = 1 + timesBorrowed tool }

updateTool :: Maybe Tool -> IO ()
updateTool Nothing =
  putStrLn "ID is no defined"
updateTool (Just tool) =
   withConn "databases/main.db" $
    \conn -> do
      let q = "UPDATE tools SET lastReturned = ?, timesBorrowed = ? WHERE id = ?;"
      execute conn q (lastReturned tool, timesBorrowed tool, toolId tool)
      putStrLn "Tool updated"
 
updateToolTable :: Int -> IO ()
updateToolTable tid =
  withConn "databases/main.db" $
    \conn -> do
      tool <- selectTool conn tid
      day  <- utctDay <$> getCurrentTime
      let updatedTool = getUpdateTool <$> tool <*> pure day
      updateTool updatedTool

checkout :: Int -> Int -> IO ()
checkout userId tid =
  withConn "databases/main.db" $
    \conn -> do
      execute conn "INSERT INTO checkedout (user_id, tool_id) VALUES (?,?)" (userId, tid)

checkin :: Int -> IO ()
checkin tid =
  withConn "databases/main.db" $
    \conn -> do
      execute conn "DELETE FROM checkedout WHERE tool_id = (?)" (Only tid)

checkinAndUpdate :: Int -> IO ()
checkinAndUpdate tid = do
  checkin tid
  updateToolTable tid




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




promptAddUser, promptAddTool, promptCheckout, promptCheckin :: IO ()

promptAddUser = do
  putStrLn "Name: "
  name <- getLine
  addUser name

promptAddTool = do
  putStrLn "Name: "
  name <- getLine
  putStrLn "Description: "
  description <- getLine
  addTool name description

promptCheckout = do
  putStrLn "User ID: "
  userID <- read <$> getLine
  putStrLn "Tool ID: "
  toolID <- read <$> getLine
  checkout userID toolID

promptCheckin = do
  putStrLn "Tool ID: "
  toolID <- read <$> getLine
  checkinAndUpdate toolID

performCommand :: String -> IO ()
performCommand "users"    = printUsers >> main
performCommand "tools"    = printTools >> main
performCommand "adduser"  = promptAddUser >> main
performCommand "addtool"  = promptAddTool >> main
performCommand "checkout" = promptCheckout >> main
performCommand "checkin"  = promptCheckin >> main
performCommand "in"       = printToolsAvailable >> main
performCommand "out"      = printToolsCheckedout >> main
performCommand "quit"     = putStrLn "Exiting..."
performCommand _          = putStrLn "Command not found" >> main

main :: IO ()
main = do
    putStrLn "Command:"
    command <- getLine
    performCommand command
