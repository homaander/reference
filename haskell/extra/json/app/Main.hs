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

data Sound = Sound
    { soundTitle  :: T.Text
    , soundAuthor :: T.Text }
    deriving (Show)

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

myBookJSON, myErrorJSON :: BC.ByteString

myBookJSON  = encode myBook
myErrorJSON = "{\"message\":\"Err\",\"error\":11}"

myJSONToErrorMessage :: Maybe ErrorMesage
myJSONToErrorMessage =  decode myErrorJSON


main :: IO ()
main = do
    putStrLn "OK"
