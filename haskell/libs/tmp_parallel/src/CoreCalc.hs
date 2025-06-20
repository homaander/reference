module CoreCalc (
    fib
  , fib2
) where

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fib2 n = helper 0 1 n
  where helper curr prev n
          | n == 0   = curr
          | n > 0    = helper (curr+prev) curr (n-1)
          | n < 0    = helper prev (curr-prev) (n+1)