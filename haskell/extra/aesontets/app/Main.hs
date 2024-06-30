{-# LANGUAGE InstanceSigs #-}
module Main (main) where

import Data.Aeson
import qualified Data.Text as T
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString.Lazy.Char8 as BC
import GHC.Generics

-- import Lib

data Book = Book
  { title  :: T.Text
  , author :: T.Text
  , year   :: Int }
  deriving (Show, Generic)

data ErrorMesage = ErrorMesage 
  { message   :: T.Text
  , errorCode :: Int }
  deriving Show

instance FromJSON Book
instance ToJSON Book

instance FromJSON ErrorMesage where
  parseJSON (Object v) = ErrorMesage <$> v .: "message" <*>  v .: "error"
  parseJSON _ = error "123"

instance ToJSON ErrorMesage where
  toJSON (ErrorMesage msg errCode) = object
    [ "message" .= msg
    , "error"   .= errCode ]

myBook :: Book
myBook =  Book {title = "A", author = "B", year = 2024}

myBookJSON, myErrorJSON :: B.ByteString

myBookJSON  = encode myBook
myErrorJSON = "{\"message\":\"Err\",\"error\":11}"

myJSONToErrorMessage :: Maybe ErrorMesage
myJSONToErrorMessage =  decode myErrorJSON

writeBook :: IO ()
writeBook = do
  B.writeFile "book.json" myBookJSON

readBook :: IO ()
readBook = do
  jsonText <- B.readFile "book.json"
  let book = case (decode jsonText :: Maybe Book) of
               Just v  -> v
               Nothing -> Book "" "" 0
  print book


main :: IO ()
main = do
  putStrLn "OK"
