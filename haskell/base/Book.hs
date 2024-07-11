module Book where

import Data.Semigroup ()
import Data.List
import qualified Data.Text as T

inc, double, square :: Num a => a -> a
inc x = x + 1
double x = x * 2
square x = x ^ 2

-- Int Integer Double Bool Char String
toDouble :: String -> Double
toDouble = read

myf :: Integral a => a -> a
myf n = if isEven
        then n - 2
        else 3 * n - 1
    where
        isEven = even n

sumSquareOrSquareSum x y =  max sumSquare squareSum
    where sumSquare = x^2 + y^2
          squareSum = (x + y)^2

sumSquareOrSquareSum2 x y = max (x^2 + y^2) ((x + y)^2)

sumSquareOrSquareSum3 x y = let sumSquare = x^2 + y^2
                                squareSum = (x + y)^2
                            in
                              max sumSquare squareSum

doubleDouble :: Num a => a -> a
doubleDouble x = (* 2) (x * 2)

counter x = (\x ->
                (\x ->
                    x + 1
                ) (x + 1)
            ) x

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

calcChange owned given = if   change - 1 > 0
                         then change
                         else 0
    where change = given - owned

cmpLNames n1 n2
    | l1 > l2 = GT
    | l1 < l2 = LT
    | otherwise = EQ
  where
      l1 = snd n1
      l2 = snd n2

cmpLNames2 n1 n2 = compare l1 l2
    where
        l1 = snd n1
        l2 = snd n2



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

getLocationFunction location =
    case location of
        "sf" -> sfOffice
        "ny" -> nyOffice
        "rn" -> rnOffice
        "ws" -> wsOffice
        _    -> (\name -> fst name ++ " " ++ snd name)

addressLetter name location = locFunc name
    where locFunc = getLocationFunction location



genIfEven f = \x -> ifEven f x
ifEvenInc = genIfEven inc

genIfEvenX x = (\f -> ifEven f x)

-- Границы типа
mySucc :: (Bounded a, Eq a, Enum a) => a -> a
mySucc n = if   n == maxBound
           then minBound
           else succ n

-- flip - изменяет порядок двух аргументов
substract2 = flip (-) 2

myflip f a b = f b a

-- * List functions

arr :: [Int]
arr = [5, 3, 5, 6, 3]
    -- 5 : 3 : 5 : 6 : 3 : []
    -- [5, 3, 5] ++ [6, 3]
    -- [1,2 .. 10]

firstVal = head arr
otherVal = tail arr

elemOnIndex4 = arr !! 4

findVal  = 4 `elem` arr
takeVals = take 5 arr
dropVals = drop 3 arr

arrInfin = cycle [1,2]
arrInfin' = repeat 1

arrPair = zip [1,2,3] ["A", "B", "C"]

mySum a b = a + b
infixRun = 4 `mySum` 4

findGCD a b = if   ost == 0
              then b
              else findGCD b ost
    where
        ost = mod a b

findGCD' a 0 = a
findGCD' a b = findGCD' b ost
    where
        ost = mod a b

myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x : myTake (n - 1) xs

myDrop 0 list = list
myDrop n (x:xs) = myDrop (n - 1) xs

myElem a list = not (null res)
    where res = filter (== a) list

-- Функции высшего порядка

mapTest = map reverse ["abc", "xyz"]

myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

filterTest = filter even [1..10]

myRemove :: (a -> Bool) -> [a] -> [a]
myRemove f [] = []
myRemove f (x:xs) = if f x
                    then myRemove f xs
                    else x : myRemove f xs

foldrTest = foldr (-) 0 [1,2,3,4]
foldlTest = foldl' (-) 0 [1..10]
foldlContact = foldl (\a b -> a ++ "," ++ b) "" ["A", "B", "C"]

concatTest = concat ["A", "B", "C"]

myFoldR _ init [] = init
myFoldR f init (x:xs) = f x res
    where res = myFoldR f init xs

makeTriple :: a -> b -> c -> (a, b, c)
makeTriple a b c = (a, b, c)

-- Классы

data Icream = Vanila | Chocolatle
    deriving (Show, Eq, Ord)

class Describable a where
    describe :: a -> String

data SixDie = S1 | S2 | S3 | S4 | S5 | S6
    deriving (Eq, Ord, Enum)

instance Show SixDie where
    show :: SixDie -> String
    show S1 = "One"
    show S2 = "Two"
    show S3 = "Three"
    show S4 = "Four"
    show S5 = "Five"
    show S6 = "Six"

-- newtype используется при одном конструкторе, и проверяется на этапе компиляции
newtype MyNames = MyNames (String, String) deriving (Show, Eq)

instance Ord MyNames where
    compare :: MyNames -> MyNames -> Ordering
    compare (MyNames (a1, b1)) (MyNames (a2, b2)) = compare (b1, a1) (b2, a2)


-- import Data.List
-- myMin :: Ord a => [a] -> a
-- myMin = head . sort

myMin :: Ord a => [a] -> a
myMin = minimum


data AA = AA0 | AA1 | AA2 | AA3 deriving (Show, Enum)

-- import Data.Semigroup
instance Semigroup AA where
    (<>) :: AA -> AA -> AA
    (<>) AA1 AA2 = AA3
    (<>) AA2 AA1 = AA3
    (<>) AA2 AA3 = AA1
    (<>) AA3 AA2 = AA1
    (<>) AA1 AA3 = AA2
    (<>) AA3 AA1 = AA2
    (<>) a   AA0 = a
    (<>) AA0 a   = a
    (<>) a   b   = AA0

instance Monoid AA where
    mempty :: AA
    mempty = AA0
    mappend :: AA -> AA -> AA
    mappend = (<>)

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 newL2
    where
        nToAdd = length l2
        repeatedL1 = map (replicate nToAdd) l1
        newL1 = mconcat repeatedL1
        newL2 = cycle l2



newtype Box a = Box a
    deriving (Show)

warp :: a -> Box a
warp = Box

unwarp :: Box a -> a
unwarp (Box a) = a



data Triple a = Triple a a a
    deriving (Show)

type Point3D = Triple Double

aPoint :: Point3D
aPoint = Triple 0.1 0.2 0.3

tripleGetX, tripleGetY, tripleGetZ :: Triple a -> a
tripleGetX (Triple x _ _) = x
tripleGetY (Triple _ x _) = x
tripleGetZ (Triple _ _ x) = x

tripleGetList :: Triple a -> [a]
tripleGetList (Triple x y z) = [x, y, z]

tripleTransform :: (a -> a) -> Triple a -> Triple a
tripleTransform f (Triple x y z) = Triple (f x) (f y) (f z)

data List a = Empty | Cons a (List a) deriving Show
