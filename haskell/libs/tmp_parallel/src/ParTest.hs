module ParTest (
    testPar
  , testPar2
) where

import Control.Monad.Par

import CoreCalc

-- >>> :t fork
-- >>> :t spawn
-- fork :: Par () -> Par ()
-- spawn :: NFData a => Par a -> Par (IVar a)

testPar :: Integer
testPar = runPar $ do
  i <- new
  j <- new
  fork $ do
    put i (fib 35)
  fork $ do
    put j (fib 36)
  a <- get i
  b <- get j
  return (a + b)

testPar2 :: Integer
testPar2 = runPar $ do
  a' <- spawn (pure $ fib 38)
  b' <- spawn (pure $ fib 39)
  a <- get a'
  b <- get b'
  return (a + b)
