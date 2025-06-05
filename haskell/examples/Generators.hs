module Generators where
import Control.Monad (guard)


-- >>> p1_ 8 == p1 8 && p1_ 8 == p1' 8 && p1_ 8 == p1'' 8
-- True



p1_ :: Int -> [Int]
p1_ n = map (2 ^) [1 .. n]


p1 :: Int -> [Int]
p1 n = [2 ^ x | x <- [1 .. n]]

p1' :: Int -> [Int]
p1' n = [1 .. n] >>= (\res -> pure (2^res))

p1'' :: Int -> [Int]
p1'' n = do
    res <- [1 .. n]
    pure (2 ^ res)



p2 :: Int -> [(Int, Int)]
p2 n = [(2^v, 3^v) | v <- [1 .. n]]

p2' :: Int -> [(Int, Int)]
p2' n = do
    val <- [1 .. n]
    let pOfTwo   = 2^val
        pOfThree = 3^val
    return (pOfTwo, pOfThree)



p3 :: Int -> [(Int, Int)]
p3 n = [(2^v, 3^v) | v <- [1 .. n], 2^v < 100, 3^v < 250]

p3' :: Int -> [(Int, Int)]
p3' n = do
    val <- [1 .. n]
    let pOfTwo   = 2^val
        pOfThree = 3^val
    guard $ pOfTwo < 100
    guard $ pOfThree < 250
    return (pOfTwo, pOfThree)

