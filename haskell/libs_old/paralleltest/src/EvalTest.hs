module EvalTest (
    ppT
  , pssT
  , ppssT

  , myStratPair

  , fib
) where

-- import Control.Parallel
import Control.Parallel.Strategies
import Control.DeepSeq

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- rpar/rpar - pure before calc
ppT :: Eval (Integer, Integer)
ppT = do
  x <- rpar (fib 36)
  y <- rpar (fib 35)
  return (x,y)


-- rpar/pseq - calc before pure
pssT:: Eval (Integer, Integer)
pssT= do
  x <- rpar (fib 36)
  y <- rseq (fib 35)
  rseq x
  return (x,y)

ppssT :: Eval (Integer, Integer)
ppssT = do
  x <- rpar (fib 36)
  y <- rpar (fib 35)
  rseq x
  rseq y
  return (x,y)



-- >>> :t force
-- force :: NFData a => a -> a

-- >>> :t rdeepseq
-- rdeepseq :: NFData a => Strategy a

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

f :: Integer
f = fib 2 `using` rpar

myStratPair :: Strategy Integer -> Strategy (Integer, Integer)
myStratPair strat (a, b) = do
  a' <- strat a
  b' <- strat b
  pure (a', b')

