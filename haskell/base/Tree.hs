module Tree () where

import Data.List

data Tree = Empty | Node Int Tree Tree
  deriving (Show, Eq)

dataRaw :: [Int]
dataRaw = [9, 18, 8, 20, 15, 12, 2, 13, 5, 16, 6, 19, 1, 7, 11, 4, 3, 10, 14, 17]

nodeRaw :: [Tree]
nodeRaw = map toNode dataRaw

dataIdeal :: [Int]
dataIdeal = [10, 5, 15, 3, 7, 13, 17, 2, 4, 6, 8, 12, 14, 16, 19, 1, 9, 11, 13, 18, 20]

nodeIdeal :: [Tree]
nodeIdeal = map toNode dataIdeal

mainTree :: Tree
mainTree = Empty

toNode :: Int -> Tree
toNode x = Node x Empty Empty

getValue :: Tree -> Int
getValue (Node x _ _) = x
getValue Empty = -1

getLeft  :: Tree -> Tree
getLeft  (Node _ x _) = x
getLeft  Empty = Empty

getRight :: Tree -> Tree
getRight (Node _ _ x) = x
getRight Empty = Empty

addNode :: Tree -> Tree -> Tree
addNode Empty node = node
addNode main Empty = main
addNode main node = if valN > getValue node
      then Node valN (addNode leftN node) rightN
      else Node valN leftN (addNode rightN node)
  where
    valN   = getValue main
    leftN  = getLeft  main
    rightN = getRight main

resultTree :: Tree
resultTree = foldl addNode mainTree nodeIdeal

printResult :: IO ()
printResult = printTree resultTree 0 ""

printTree :: Tree -> Int -> String -> IO ()
printTree Empty deep _ = return ()
printTree tree deep s = do
  putStr $ intercalate "    " $ replicate deep "|"
  putStrLn $ s ++ show (getValue tree)
  printTree (getRight tree) (deep + 1) ">r: "
  -- putStrLn $ intercalate "    " $ replicate (deep + 1) "|"
  printTree (getLeft  tree) (deep + 1) ">l: "

