module Syntax where

import Data.Semigroup ()
import Data.List
import qualified Data.Text as T

inc, double, square :: Num a => a -> a
inc x = x + 1
double x = x * 2
square x = x ^ 2

-- * Int Integer Double Bool Char String
toDouble :: String -> Double
toDouble = read

myf :: Integral a => a -> a
myf n = if isEven
        then n - 2
        else 3 * n - 1
  where
    isEven = even n

sumSquareOrSquareSum1 :: (Num a, Ord a) => a -> a -> a
sumSquareOrSquareSum1 x y =  max sumSquare squareSum
    where sumSquare = x^2 + y^2
          squareSum = (x + y)^2

sumSquareOrSquareSum2 :: (Num a, Ord a) => a -> a -> a
sumSquareOrSquareSum2 x y = max (x^2 + y^2) ((x + y)^2)

sumSquareOrSquareSum3 :: (Num a, Ord a) => a -> a -> a
sumSquareOrSquareSum3 x y = 
  let 
    sumSquare = x^2 + y^2
    squareSum = (x + y)^2
  in
    max sumSquare squareSum

doubleDouble :: Num a => a -> a
doubleDouble x = (*2) (x * 2)

-- counter :: Num a => a -> a
-- counter x = (\x -> (\x -> x + 1) (x + 1)) x

ifEven :: Integral t => (t -> t) -> t -> t
ifEven f x = if   even x
             then f x
             else x

names :: [(String, String)]
names  = [
           ("Axxx", "Zxxx")
         , ("Bxxx", "Yxxx")
         , ("Cxxx", "Xxxx")
         , ("Dxxx", "Wxxx")
         ]

calcChange :: (Ord a, Num a) => a -> a -> a
calcChange owned given = if   change - 1 > 0
                         then change
                         else 0
  where change = given - owned

cmpLNames :: Ord a1 => (a2, a1) -> (a3, a1) -> Ordering
cmpLNames n1 n2 | l1 > l2 = GT
                | l1 < l2 = LT
                | otherwise = EQ
  where
    l1 = snd n1
    l2 = snd n2

cmpLNames2 :: Ord a1 => (a2, a1) -> (a3, a1) -> Ordering
cmpLNames2 n1 n2 = compare l1 l2
    where
        l1 = snd n1
        l2 = snd n2



sfOffice, nyOffice, rnOffice, wsOffice :: (String, String) -> String
sfOffice name = if lastName < "L"
                then nameText ++ " San-Fran 94111"
                else nameText ++ " San-Fran 94109"
  where
    lastName = snd name
    nameText = fst name ++ " " ++ lastName

nyOffice name = nameText ++ ": New-York 10013"
  where nameText = fst name ++ " " ++ snd name

rnOffice name = nameText ++ " Rino 89523"
  where nameText = fst name ++ " " ++ snd name

wsOffice name = "Dear " ++ nameText ++ " Wash 89523"
  where nameText = fst name ++ " " ++ snd name

getLocationFunction :: String -> (String, String) -> String
getLocationFunction location =
  case location of
    "sf" -> sfOffice
    "ny" -> nyOffice
    "rn" -> rnOffice
    "ws" -> wsOffice
    _    -> (\name -> fst name ++ " " ++ snd name)

addressLetter :: (String, String) -> String -> String
addressLetter name location = locFunc name
  where locFunc = getLocationFunction location



genIfEven :: Integral t => (t -> t) -> t -> t
--genIfEven f = \x -> ifEven f x
genIfEven = ifEven

ifEvenInc :: Int -> Int
ifEvenInc = genIfEven inc

genIfEvenX :: Integral t => t -> (t -> t) -> t
-- genIfEvenX x = (\f -> ifEven f x)
genIfEvenX x = (`ifEven` x)

-- Границы типа
mySucc :: (Bounded a, Eq a, Enum a) => a -> a
mySucc n = if   n == maxBound
           then minBound
           else succ n

-- flip - изменяет порядок двух аргументов
substract2 :: Int -> Int
substract2 = flip (-) 2

myflip :: (a -> b -> c) -> b -> a -> c
myflip f a b = f b a

-- * Функции списка
arr :: [Int]
arr = [5, 3, 5, 6, 3]
--    5 : 3 : 5 : 6 : 3 : []
--    [5, 3, 5] ++ [6, 3]
--    [1,2 .. 10]

firstVal, elemOnIndex :: Int
firstVal    = head arr
elemOnIndex = arr !! 4

otherVal :: [Int]
otherVal  = tail arr

valInArr :: Bool
valInArr  = 4 `elem` arr

takeVals, dropVals, arrInfin, arrInfin' :: [Int]
takeVals = take 5 arr
dropVals = drop 3 arr

arrInfin  = cycle  [1,2]
arrInfin' = repeat 1

mySum :: Num a => a -> a -> a
mySum a b = a + b

findGCD :: Int -> Int -> Int
findGCD a b = if   ost == 0
              then b
              else findGCD b ost
  where
    ost = mod a b

findGCD' :: Int -> Int -> Int
findGCD' a 0 = a
findGCD' a b = findGCD' b ost
  where
    ost = mod a b

myTake, myDrop :: (Eq t, Num t) => t -> [a] -> [a]
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x : myTake (n - 1) xs

myDrop 0 list   = list
myDrop n (x:xs) = myDrop (n - 1) xs

myElem :: Eq a => a -> [a] -> Bool
myElem a list = not (null res)
  where res = filter (== a) list

-- import Data.List
myMin :: Ord a => [a] -> a
myMin  = minimum
-- myMin = head . sort

-- * Функции высшего порядка
arrPair :: [(Int, String)]
arrPair = zip [1,2,3] ["A", "B", "C"]

arrSum, filterTest :: [Int]
arrSum  = zipWith (+) [1,2,3] [10,20,10]
filterTest = filter even [1..10]

mapTest :: [String]
mapTest = map reverse ["abc", "xyz"]

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

myFilterNot :: (a -> Bool) -> [a] -> [a]
myFilterNot f [] = []
myFilterNot f (x:xs) = if f x
                       then myFilterNot f xs
                       else x : myFilterNot f xs

foldrTest, foldlTest :: Int
foldrTest = foldr  (-) 0 [1, 2, 3, 4]
foldlTest = foldl' (-) 0 [1..10]

concatTest, foldlContact :: String
foldlContact = foldl (\a b -> a ++ "," ++ b) "" ["A", "B", "C"]
concatTest   = concat ["A", "B", "C"]

myFoldR :: (a -> b -> b) -> b -> [a] -> b
myFoldR _ init [] = init
myFoldR f init (x:xs) = f x res
  where
    res = myFoldR f init xs

makeTriple :: a -> b -> c -> (a, b, c)
makeTriple a b c = (a, b, c)

-- * Классы
-- newtype используется при одном конструкторе, и проверяется на этапе компиляции
--   Используется для реализации классов для существующих типов
newtype MyNames = MyNames (String, String) deriving (Show, Eq)

instance Ord MyNames where
  compare :: MyNames -> MyNames -> Ordering
  compare (MyNames (a1, b1)) (MyNames (a2, b2)) = compare (b1, a1) (b2, a2)



newtype Box a = Box a
  deriving (Show)

class Boxing b where
  -- ! Minimal: wrap & unwarp
  warp   :: a -> b a
  unwarp :: b a -> a
  addOne :: (Num a) => b a -> b a

  -- * Default instance
  addOne bb = warp (unwarp bb + 1)

instance Boxing Box where
  warp :: a -> Box a
  unwarp :: Box a -> a

  warp  = Box
  unwarp (Box a) = a

-- >>> addOne (Box 1)
-- Box 2


data AA = AA0
        | AA1
        | AA2
        | AA3
  deriving (Enum)

instance Show AA where
  show :: AA -> String

  show AA0 = "First"
  show AA1 = "Second"
  show AA2 = "Three"
  show AA3 = "Four"

-- import Data.Semigroup
instance Semigroup AA where
  (<>) :: AA -> AA -> AA

  AA1 <> AA2 = AA3
  AA1 <> AA3 = AA2
  AA2 <> AA1 = AA3
  AA2 <> AA3 = AA1
  AA3 <> AA1 = AA2
  AA3 <> AA2 = AA1
  a   <> AA0 = a
  AA0 <> a   = a
  a   <> b   = AA0

instance Monoid AA where
  mempty :: AA
  mappend :: AA -> AA -> AA

  mempty = AA0
  mappend = (<>)



cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 newL2
  where
    nToAdd = length l2
    repeatedL1 = map (replicate nToAdd) l1
    newL1 = mconcat repeatedL1
    newL2 = cycle l2



data Triple a = Triple a a a
  deriving (Show)

type Point3D = Triple Double

aPoint :: Point3D
aPoint  = Triple 0.1 0.2 0.3

tripleGetX, tripleGetY, tripleGetZ :: Triple a -> a
tripleGetX (Triple x _ _) = x
tripleGetY (Triple _ x _) = x
tripleGetZ (Triple _ _ x) = x

tripleGetList :: Triple a -> [a]
tripleGetList (Triple x y z) = [x, y, z]

tripleTransform :: (a -> a) -> Triple a -> Triple a
tripleTransform f (Triple x y z) = Triple (f x) (f y) (f z)

data List a = Empty | Cons a (List a) deriving Show
