module ParTest where

import Control.Monad.Par

-- >>> :t fork
-- >>> :t spawn
-- fork :: Par () -> Par ()
-- spawn :: NFData a => Par a -> Par (IVar a)


fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

testPar :: Integer
testPar = runPar $ do
  i <- new
  j <- new
  fork (put i (fib 23))
  fork (put j (fib 43))
  a <- get i
  b <- get j
  return (a + b)
