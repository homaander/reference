{-# LANGUAGE InstanceSigs #-}
module Main (main) where

import Data.Aeson
import qualified Data.Text as T
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString.Lazy.Char8 as BC

import Lib

-- >>> myBook
-- Book {title = "A", author = "B", year = 2024}
myBook :: Book
myBook =  Book {title = "A", author = "B", year = 2024}

-- >>> myBookJSON
-- >>> myErrorJSON
-- "{\"author\":\"B\",\"title\":\"A\",\"year\":2024}"
-- "{\"message\":\"Err\",\"error\":11}"
myBookJSON, myErrorJSON :: B.ByteString
myBookJSON  = encode myBook
myErrorJSON = "{\"message\":\"Err\",\"error\":11}"

-- >>> myJSONToErrorMessage
-- Just (ErrorMesage {message = "Err", errorCode = 11})
myJSONToErrorMessage :: Maybe ErrorMesage
myJSONToErrorMessage =  decode myErrorJSON

writeBook :: IO ()
writeBook = do
  B.writeFile "data/book.json" myBookJSON

readBook :: IO ()
readBook = do
  jsonText <- B.readFile "data/book.json"
  let book = case (decode jsonText :: Maybe Book) of
               Just v  -> v
               Nothing -> Book "" "" 0
  print book


main :: IO ()
main = do
  writeBook
  readBook
  putStrLn "OK"
