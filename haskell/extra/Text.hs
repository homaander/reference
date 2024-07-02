{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

-- ! Написать примеры
import qualified Data.Text.Encoding as E

myVal :: T.Text
myVal = "Привет!"

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

ll :: Num a => [a] -> [a] -> [a]
ll = zipWith (+)

main :: IO ()
main = do
    TIO.putStrLn myVal