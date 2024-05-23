data Al4 = A1 | A2 | A3 | A4 deriving (Show, Bounded, Enum)
data Al3 = Alpha | Beta | Gamma deriving (Show, Bounded, Enum)

maxChar :: Int
maxChar = fromEnum (maxBound :: Char)

rotChar :: Char -> Char
rotChar = rotN (maxChar + 1)

rotCharDecoder :: Char -> Char
rotCharDecoder = rotNdecoder (maxChar + 1)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN aSize c = toEnum rotation
    where
        rotation = offset `mod` aSize
        offset = fromEnum c + halfSize
        halfSize = aSize `div` 2

rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder aSize c = toEnum rotation
    where
        rotation = offset `mod` aSize
        offset = if even aSize
                 then fromEnum c + halfSize
                 else 1 + fromEnum c + halfSize
        halfSize = aSize `div` 2

messageAl4 :: [Al4]
messageAl4 = [A3, A1, A1, A2, A4, A3]

messageAl3 :: [Al3]
messageAl3 = [Alpha, Alpha, Gamma, Beta, Gamma]

rotAl4 :: [Al4] -> [Al4]
rotAl4 = map (rotN 4)

rotAl3 :: [Al3] -> [Al3]
rotAl3 = map (rotN 3)

rotAl3decoder :: [Al3] -> [Al3]
rotAl3decoder = map (rotNdecoder 3)

rotEncoder :: String -> String
rotEncoder = map rotChar

rotDecoder :: String -> String
rotDecoder = map rotCharDecoder
