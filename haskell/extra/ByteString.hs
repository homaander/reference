{-# LANGUAGE OverloadedStrings #-}

module ByteString where


import qualified Data.ByteString       as B
import qualified Data.ByteString.Char8 as BC

-- >>> B.head myVal
-- >>> B.index myVal 3
-- 72
-- 108

-- >>> :t B.pack
-- >>> :t BC.pack
-- B.pack  :: [Word8] -> ByteString
-- BC.pack :: String -> ByteString

-- >>> B.pack (map fromIntegral [96 + 1 .. 96 + 26])
-- >>> B.pack (map fromIntegral [64 + 1 .. 64 + 26])
-- "abcdefghijklmnopqrstuvwxyz"
-- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

-- >>> B.unpack myVal
-- [72,101,108,108,111]

-- >>> B.pack [72,101,108,108,111]
-- "Hello"


-- * import qualified Data.Text as T
-- * import qualified Data.Text.Encoding as E
-- ? E.decodeUtf8         ByteString -> Text
-- ? E.decodeUtf16LE      ByteString -> Text
-- ? E.decodeUtf16BE      ByteString -> Text

-- ? E.encode...          Text -> ByteString
-- -- 𐑙 == [0xD8, 0x01, 0xDC, 0x59] == [216,1,220,89]

-- -- >>> TIO.putStrLn $ E.decodeUtf16BE $ B.pack [0xD8, 0x01, 0xDC, 0x59]
-- -- 𐑙
-- -- >>> B.unpack $ E.encodeUtf16BE ("𐑙" :: T.Text)
-- -- [216,1,220,89]


-- * import Data.Char
-- -- >>> chr (64 + 1)
-- -- >>> chr (96 + 1)
-- -- 'A'
-- -- 'a'

-- * import Data.ByteString.Internal
-- -- >>> w2c $ B.head myVal
-- -- >>> c2w 'F'
-- -- 'H'
-- -- 70

-- * import Data.Word
-- -- >>> :t fromIntegral (64 + 5) :: Word8
-- -- fromIntegral (64 + 5) :: Word8 :: Word8

myVal :: B.ByteString
myVal = "Hello"

main :: IO ()
main = do
    putStrLn "BS Example"
