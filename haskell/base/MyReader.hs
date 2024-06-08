module MyReader where

import Control.Monad.Reader

myVal :: Reader Int Int
myVal = reader $ const 44

gg :: Reader Int Int
gg = local (+ 100) myMain

myMain :: Reader Int Int
myMain = do
    x <- ask
    let res = x + 1
    return res

main :: IO ()
main = do
    let
        all = runReader myMain 5
    putStrLn "Test Read:"
    putStrLn $ "->  All " ++ show all