module EvalTest (
    testEval

  , ppT
  , ppssT

  , my_parPair
) where

-- import Control.Parallel
import Control.Parallel.Strategies
-- import Control.DeepSeq

import CoreCalc

testEval :: IO ()
testEval = do
  let x = map fib [1..40] `using` parList rdeepseq
  print x

my_parPair :: Strategy a -> Strategy (a, a)
my_parPair strat (a, b) = do
  a' <- strat a
  b' <- strat b
  pure (a', b')

-- rpar/rpar - pure before calc
ppT :: Eval (Integer, Integer)
ppT = do
  x <- rpar (fib 33)
  y <- rpar (fib 44)
  return (x,y)

-- rpar/pseq - calc before pure
ppssT :: Eval (Integer, Integer)
ppssT = do
  x <- rpar (fib 32)
  y <- rpar (fib 45)
  rseq x
  rseq y
  return (x,y)

-- >>> :t force
-- force :: NFData a => a -> a

-- >>> :t rdeepseq
-- rdeepseq :: NFData a => Strategy a

-- >>> :t parPair
-- parPair :: Strategy a -> Strategy b -> Strategy (a, b)

-- ? rpar :: Strategy a
-- * Strategy a == a -> Eval a
-- >>> :t parPair
-- >>> :t parMap
-- >>> :t parList
-- >>> :t evalList
-- parPair :: Strategy a -> Strategy b -> Strategy (a, b)
-- parMap :: Strategy b -> (a -> b) -> [a] -> [b]
-- parList :: Strategy a -> Strategy [a]
-- evalList :: Strategy a -> Strategy [a]

