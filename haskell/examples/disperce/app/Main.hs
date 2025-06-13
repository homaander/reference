{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
module Main where

import System.Random
import Data.List

main :: IO ()
main = do
  print res


res :: Int
res = 
  let
    arr = [10,20,50,100]

    roll = uniformR (0, 3)
    rolls = unfoldr (Just . roll)
    pureGen = mkStdGen 422
    h = take 100 (rolls pureGen)

    res1 = map (arr !!) h
  in
    sum res1


class Collection c a where
  insert :: c -> a -> c
  contains :: c -> a -> Bool

instance Collection [Int] Int where
  insert = flip (:)
  contains = flip elem

test :: [Int] -> Bool
test list = contains list (42 :: Int)  -- Теперь `a` однозначно `Int`!

