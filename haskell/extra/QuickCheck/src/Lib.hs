module Lib where

import qualified Data.Text as T
import GHC.Generics
import Data.Aeson

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

someFunc :: IO ()
someFunc = putStrLn "someFunc"

mySuperFunction :: Int -> Int -> Int
mySuperFunction a b = if a > b
                      then b + 10
                      else a + 1
