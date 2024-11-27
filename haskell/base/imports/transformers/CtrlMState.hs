{-# LANGUAGE TupleSections #-}

module CtrlMStateT where

import  Control.Monad.Trans.State

myVal :: StateT Int Maybe Int
myVal  = state (1,)

-- State s a
-- runState :: s -> (s, a)

myMain :: StateT Int Maybe Int
myMain  = do
    x <- get
    let res = x + 1
    put 4
    modify (^ 3)
    return $ 10000 + res

main :: IO ()
main  = do
    let
        allV = runStateT  myMain 5
        valV = evalStateT myMain 5
        sttV = execStateT myMain 5
    putStrLn "Test State:"
    putStrLn $ "->  All " ++ show allV
    putStrLn $ "->  Val " ++ show valV
    putStrLn $ "->  St  " ++ show sttV

-- type State = StateT s Identify

myMain :: State Int Int
myMain  = do
    x <- get
    let res = x + 1
    put 4
    modify (+ 3)
    return res

main :: IO ()
main  = do
    let
        all = runState  myMain 5
        val = evalState myMain 5
        stt = execState myMain 5
    putStrLn "Test State:"
    putStrLn $ "->  All " ++ show all
    putStrLn $ "->  Val " ++ show val
    putStrLn $ "->  St  " ++ show stt
