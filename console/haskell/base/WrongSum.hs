digs :: Int -> [Int]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

undigs :: [Int] -> Int
undigs [] = 0
undigs a = (read . foldl (\x y -> x ++ show y) "") a

digAdd :: [Int] -> [Int] -> [Int]
digAdd = zipWith (+)

add :: Int -> Int -> Int
add a b = if dif >= 0
          then undigs (digAdd c1 (replicate  dif 0 ++ c2))
          else undigs (digAdd (replicate (-dif) 0 ++ c1) c2)
  where
    dif = l1 - l2
    c1 = digs a
    c2 = digs b
    l1 = length c1
    l2 = length c2