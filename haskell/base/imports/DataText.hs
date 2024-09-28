{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

-- * Работа с кодировками
import qualified Data.Text.Encoding as E

-- >>> :t T.pack
-- >>> :t T.unpack
-- T.pack :: String -> Text
-- T.unpack :: Text -> String


myVal :: T.Text
myVal = "Привет, "

main :: IO ()
main = do
    TIO.putStr "Имя: "
    name <- TIO.getLine
    TIO.putStrLn $ T.concat [myVal, name, " АБВ!"]
