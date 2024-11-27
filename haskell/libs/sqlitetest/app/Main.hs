module Main (main) where

import Tools
import Users

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
