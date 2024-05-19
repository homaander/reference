module Nat where

data Nat = O | I Nat
    deriving (Show)

add :: Nat -> (Nat -> Nat)
add     O = id
add (I a) = (I .) (add a)

toNat :: Int -> Nat
toNat 0 = O
toNat n = I (toNat (n - 1))

toIntB :: Int -> Nat -> Int
toIntB n O     = n
toIntB n (I a) = toIntB (n + 1) a

toInt :: Nat -> Int
toInt = toIntB 0

