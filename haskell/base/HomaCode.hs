module HomaCode where

import Data.Char ( digitToInt )

type HomaCode       = [Int]

toIntList :: String -> HomaCode
toIntList = map digitToInt

encodeNHoma :: Int -> HomaCode -> HomaCode
encodeNHoma n arr = iterate encodeHoma arr !! n

encodeHoma  :: HomaCode -> HomaCode
encodeHoma  = encodeHoma' . reverse

encodeHoma' :: HomaCode -> HomaCode
encodeHoma' [a]      = [a]
encodeHoma' (a:b:bs) = res : encodeHoma' (b:bs)
  where res = (a - b + 10) `mod` 10