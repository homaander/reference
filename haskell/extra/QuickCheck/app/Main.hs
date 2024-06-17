module Main (main) where

import Lib

import qualified Data.ByteString.Lazy as B
import Data.Aeson

myBook :: Book
myBook =  Book {title = "A", author = "B", year = 2024}

myBookJSON, myErrorJSON :: B.ByteString

myBookJSON  = encode myBook
myErrorJSON = "{\"message\":\"Err\",\"error\":11}"

myJSONToErrorMessage :: Maybe ErrorMesage
myJSONToErrorMessage =  decode myErrorJSON

main :: IO ()
main = do
    print myBook
    print myBookJSON
    print myJSONToErrorMessage
    print myErrorJSON

