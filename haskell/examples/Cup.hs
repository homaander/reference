cup :: Int -> (Int -> Int) -> Int
cup ml message = message ml

coffeCup :: (Int -> t) -> t
coffeCup = cup 500

getMl aCup = aCup id

ifEmpty :: (Eq a, Num a) => ((p -> p) -> a) -> Bool
ifEmpty aCup = getMl aCup == 0

drink aCup n = if res < 0
               then cup 0
               else cup res
    where
        ml = getMl aCup
        res = ml - n

afterManySips = foldl drink coffeCup [29, 32, 43, 54]