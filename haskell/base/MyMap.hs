module MyMap where

import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

organs :: [Organ]
organs = [Heart, Brain, Brain, Heart, Spleen, Spleen, Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24,30]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

result :: Maybe Organ
result = Map.lookup 7 organCatalog

myList :: Map.Map Int String
myList = Map.fromList [(1, "A"), (2, "B")]

mapMain :: Maybe String
mapMain = do
    a <- Map.lookup 1 myList
    b <- Map.lookup 2 myList
    let c = a ++ b
    return c