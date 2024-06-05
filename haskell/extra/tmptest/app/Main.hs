{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import Lib
import QQ

dd :: String
dd = [myqq| ewqwqww |]

test :: (Int, Int, Int)
test = (3, 3, 5)

main :: IO ()
main = do
  print ($(fstN 3) test)
  print ($(myFst3) test)
  print (dd)