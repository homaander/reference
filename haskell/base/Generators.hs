powersOfTwo :: Int -> [Int]
powersOfTwo n = do
    res <- [1 .. n]
    pure (2 ^ res)

powersOfTwo2 :: Int -> [Int]
powersOfTwo2 n = [1 .. n] >>= (\res -> pure (2^res))

powersOfTwo3 :: Int -> [Int]
powersOfTwo3 n = map (2 ^) [1 .. n]

powersOfTwoAndThree :: Int -> [(Int, Int)]
powersOfTwoAndThree n = do
    val <- [1 .. n]
    let pOfTwo   = 2^val
    let pOfThree = 3^val
    return (pOfTwo, pOfThree)

powersOfTwoAndThree2 :: Int -> [(Int, Int)]
powersOfTwoAndThree2 n = [(2^v, 3^v) | v <- [1 .. n]]