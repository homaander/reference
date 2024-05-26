module Tools where

import MainDB
import Data.Time
import Database.SQLite.Simple

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
