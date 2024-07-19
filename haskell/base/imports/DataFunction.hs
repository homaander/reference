module DataFunction where

import Data.Function

showInt :: Int -> Int -> String
showInt = on (++) show

main :: IO ()
main = do
    print $ showInt 10 20
    print $ 5 & (+1)