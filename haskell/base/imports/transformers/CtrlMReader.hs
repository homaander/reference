module CtrlMReader where

import  Control.Monad.Trans.Reader
import Control.Monad.Identity (Identity)

-- myVal :: Reader Int Int
myVal :: ReaderT Int Identity Int
myVal  = reader $ const 44

gg :: Reader Int Int
gg  = local (+ 100) myMain

testVal :: Reader Int Bool
testVal = do
    x <- ask
    pure (x > 3)

myMain :: Reader Int Int
myMain  = do
    x <- ask
    pure $ x + 1

main :: IO ()
main  = do
  let
    app = runReader $ do 
      b <- testVal
      if b then do
        x <- myMain
        pure $ x + 2
      else
        pure 0
  putStrLn "Test Read:"
  putStrLn $ "->  All " ++ (show $ app 5)