module MyState where

import Control.Monad.State

myVal :: State Int Int
myVal = state (44,)

myMain :: State Int Int
myMain = do
    x <- get
    let res = x + 1
    put 4
    modify (+ 3)
    return res

main :: IO ()
main = do
    let
        all = runState  myMain 5
        val = evalState myMain 5
        stt = execState myMain 5
    putStrLn "Test State:"
    putStrLn $ "->  All " ++ show all
    putStrLn $ "->  Val " ++ show val
    putStrLn $ "->  St  " ++ show stt
