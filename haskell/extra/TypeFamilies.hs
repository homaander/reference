{-# LANGUAGE TypeFamilies #-}

import Data.Kind

-- Declare a list-like data family
data family XList a :: Type

data instance XList Char = XCons !Char !(XList Char) | XNil
data instance XList ()   = XListUnit !Int

-- >>> :t XCons 'A' (XCons 'B' XNil)
-- >>> :t XListUnit 12
-- XCons 'A' (XCons 'B' XNil) :: XList Char
-- XListUnit 12 :: XList ()


-- >>> f $ XCons 'A' (XCons 'B' XNil)
-- >>> f $ XListUnit 12
-- 10
-- 10
f :: XList a -> Int
f a = 10


data MyNames = Andrew 
             | Vitya
    deriving Show

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
-- >>>
-- >>>
-- (Vitya,102)

