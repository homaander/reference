module Generators where
import Control.Monad (guard)

powers :: Int -> [Int]
powers n = do
    res <- [1 .. n]
    pure (2 ^ res)

powers' :: Int -> [Int]
powers' n = [1 .. n] >>= (\res -> pure (2^res))

powers'' :: Int -> [Int]
powers'' n = map (2 ^) [1 .. n]

powers_2_3 :: Int -> [(Int, Int)]
powers_2_3 n = do
    val <- [1 .. n]
    let pOfTwo   = 2^val
        pOfThree = 3^val
    return (pOfTwo, pOfThree)

powers_2_3' :: Int -> [(Int, Int)]
powers_2_3' n = [(2^v, 3^v) | v <- [1 .. n]]

powers_2_3_l100 :: Int -> [(Int, Int)]
powers_2_3_l100 n = [(2^v, 3^v) | v <- [1 .. n], 2^v < 100, 3^v < 250]

powers_2_3_l100' :: Int -> [(Int, Int)]
powers_2_3_l100' n = do
    val <- [1 .. n]
    let pOfTwo   = 2^val
        pOfThree = 3^val
    guard $ pOfTwo < 100
    guard $ pOfThree < 250
    return (pOfTwo, pOfThree)

