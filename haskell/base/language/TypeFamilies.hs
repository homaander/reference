-- For type|data family
{-# LANGUAGE TypeFamilies #-}
-- For values as type|kind
{-# LANGUAGE DataKinds #-}
-- For ~ in constraint
{-# LANGUAGE UndecidableInstances #-}

import Data.Kind
import Data.Bool

import Data.Functor.Identity
import Data.Binary
import Data.Maybe

import Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString


-- >>> jj (10 :: A (Maybe Int)) (10 :: A (Maybe Int))
-- 20

type family A f
type instance A (Maybe Int) = Int
type instance A (Either String Int) = Int

jj :: (Num a, a ~ c, b ~ c, A (Maybe a) ~ A (Either String b)) => a -> b -> c
jj a b = a + b


-- >>> hkdIdPlus hkdId
-- >>> hkdMbPlus hkdMb
-- 11
-- Just 2

type family HKD f a where
  HKD Identity a = a
  HKD f        a = f a

hkdId :: HKD Identity Int
hkdId = 10
hkdMb :: HKD Maybe Int
hkdMb = Just 1

hkdIdPlus :: HKD Identity Int -> Int
hkdIdPlus a = a + 1
hkdMbPlus :: HKD Maybe Int -> Maybe Int
hkdMbPlus a = (+1) <$> a



-- >>> hdFPlus (Just 5)
-- >>> hdMPlus (Just 5)
-- >>> hdFPlus (Identity 5)
-- >>> hdMPlus (Identity 5)
-- Just 6
-- Just 10
-- Identity 6
-- Identity 10

type family HD f a where
  HD f a = f a

hdFPlus :: (Functor f) => HD f Int -> f Int
hdFPlus a = (+1) <$> a

hdMPlus :: (Monad f) => HD f Int -> f Int
hdMPlus a = (+) <$> a <*> a


type MaybeIf :: Bool -> Type -> Type
type family MaybeIf b where
  MaybeIf True  = Maybe
  MaybeIf False = Identity

data PlayerInfo b =
  MkPlayerInfo { name  :: MaybeIf b String
               , score :: MaybeIf b Integer }

player1 :: PlayerInfo False
player1 = MkPlayerInfo { name  = Identity "AAA"
                       , score = Identity 12 }

player2 :: PlayerInfo True
player2 = MkPlayerInfo { name  = Just "BBB"
                       , score = Nothing }

dbReadPlayerInfo :: IO (PlayerInfo False)
dbReadPlayerInfo = do
  return MkPlayerInfo { name  = Identity "AAA"
                      , score = Identity 12 }

dbUpdatePlayerInfo :: PlayerInfo True -> IO ()
dbUpdatePlayerInfo a = do
  let (MkPlayerInfo n s) = a
  print n
  print s




type Label :: Type -> Type
type family Label t
type instance Label Double = Int
type instance Label String = Int
type instance Label Bool   = Int


-- Declare a list-like data family
data family XVal a :: Type
newtype instance XVal Int  = XInt Int
newtype instance XVal Char = XChar Char
newtype instance XVal ()   = XNil Int

instance Show (XVal a) where
  show _ = "XVal"

-- >>> elements [1]
-- >>> elements $ Just 1
-- >>> elements $ ByteString.pack [70,71]
-- [1]
-- [1]
-- [70,71]

type family Unwrap x where
  Unwrap (f a) = a
  
class Container a where
  type Elem a
  type Elem x = Unwrap x
  elements :: a -> [Elem a]

instance Container [a] where
  elements = id
  
instance Container (Maybe a) where
  elements = maybeToList
  
instance Container ByteString where
  type Elem ByteString = Word8
  elements = ByteString.unpack



data MyNames = Andrew | Vitya
    deriving Show

-- data ZipConteiner внутри класса обьявляет data family
-- внутри instance иы определяем data instance
-- Есть значение по умолчанию

class MyZip a where
    data ZipConteiner a b
    myZipPack :: (a, b) -> ZipConteiner a b
    myZipNum  :: ZipConteiner a Int -> (a, Int)
    myZipOth  :: Show b => ZipConteiner a b -> (a, String)

instance MyZip MyNames where
    data ZipConteiner MyNames b = MyZipNum MyNames b
    myZipPack (a, b) = MyZipNum a b
    myZipNum (MyZipNum a i) = (a, i + 100)
    myZipOth (MyZipNum a s) = (a, show s ++ "!!")

val :: ZipConteiner MyNames Int
val = myZipPack (Vitya, 2)

-- >>> myZipNum val
-- (Vitya,102)

