module Main (main) where

import Graphics.Vty
import Graphics.Vty.Platform.Windows (mkVty)

mainMenuAttrList :: [String]
mainMenuAttrList =  ["User", "Inventory", "Shop", "Exit"]

main :: IO ()
main = do
    vty <- mkVty defaultConfig
    showMenu vty $ getMainMenu 1
    getKey vty 1

getKey :: Vty -> Int -> IO ()
getKey vty line = do
  e <- nextEvent vty

  let newline = getNewLine e line

  if newline == 0
    then do
      shutdown vty
      let val = getSelected line
      putStrLn $ "You selected: " ++ val
    else do
      showMenu vty $ getMainMenu newline
      getKey vty newline

getNewLine :: Event -> Int -> Int
getNewLine e line = case e of
  (EvKey KDown  _) -> if line == 4 then 1 else line + 1
  (EvKey KUp    _) -> if line == 1 then 4 else line - 1
  (EvKey KEnter _) -> 0
  _                -> line

getSelected :: Int -> String
getSelected st = val
  where
    val = mainMenuAttrList !! (st - 1)



getMainMenu :: Int -> [Image]
getMainMenu st = foldl (turnSelected st) [] mainMenuAttrList

turnSelected :: Int -> [Image] -> String -> [Image]
turnSelected st res name = if length res == st - 1
  then res ++ [string turnOn  name]
  else res ++ [string turnOff name]
    where
      turnOn  = defAttr `withForeColor` black `withBackColor` green
      turnOff = defAttr `withForeColor` green `withBackColor` black

showMenu :: Vty -> [Image] -> IO ()
showMenu vty imgs = do 
  let
    img = vertCat imgs
    pic = picForImage img
  update vty pic