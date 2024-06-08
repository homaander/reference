{-# LANGUAGE TypeFamilies #-}

import Data.Kind
import Data.IntMap

-- Declare a list-like data family
data family XList a

-- Declare a list-like instance for Char
data instance XList Char = XCons !Char !(XList Char) | XNil

-- Declare a number-like instance for ()
data instance XList () = XListUnit !Int

class GMapKey k where
  data GMap k :: Type -> Type
  empty       :: GMap k v
  lookup      :: k -> GMap k v -> Maybe v
  insert      :: k -> v -> GMap k v -> GMap k v

instance GMapKey Int where
  data GMap Int v        = GMapInt (Data.IntMap.IntMap v)
  empty                  = GMapInt Data.IntMap.empty
  lookup k   (GMapInt m) = Data.IntMap.lookup k m
  insert k v (GMapInt m) = GMapInt (Data.IntMap.insert k v m)



class MyC f where
  data MyF f :: Type -> Type
  myZipNum :: MyF f Int -> (f, Int)
  myZipOth :: (Show resT) => MyF f resT -> (f, String)

data MyNames = Andrew | Vitya
  deriving Show

instance MyC MyNames where
  data MyF MyNames Int    = MyPNum MyNames Int

  myZipNum (MyPNum a b) = (a, b)
  myZipOth v = (Andrew, "12")

