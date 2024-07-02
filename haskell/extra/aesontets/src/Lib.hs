module Lib where

import GHC.Generics
import Data.Aeson
import qualified Data.Text as T

data Book = Book
  { title  :: T.Text
  , author :: T.Text
  , year   :: Int }
  deriving (Show, Generic)

instance FromJSON Book
instance ToJSON Book



data ErrorMesage = ErrorMesage 
  { message   :: T.Text
  , errorCode :: Int }
  deriving Show

instance FromJSON ErrorMesage where
  parseJSON (Object v) = ErrorMesage <$> v .: "message" <*>  v .: "error"
  parseJSON _ = error "123"

instance ToJSON ErrorMesage where
  toJSON (ErrorMesage msg errCode) = object
    [ "message" .= msg
    , "error"   .= errCode ]
