import Data.List
import Data.Semigroup

import qualified Data.Map as Map
import qualified Data.Text as T

calcChange owned given = if change > 0
        then change
        else 0
    where change = given - owned

inc x = x + 1
double x = x * 2
square x = x ^ 2

myf n = if isEven
        then n - 2
        else 3 * n - 1
    where
        isEven = even n

sumSquareOrSquareSum x y =  if sumSquare > squareSum
                            then sumSquare
                            else squareSum
    where sumSquare = x^2 + y^2
          squareSum = (x + y)^2

sumSquareOrSquareSum2 x y = (\sumSquare squareSum ->
          if sumSquare > squareSum
          then sumSquare
          else squareSum) (x^2 + y^2) ((x + y)^2)

sumSquareOrSquareSum3 x y = let sumSquare = x^2 + y^2
                                squareSum = (x + y)^2
                            in
                              if sumSquare > squareSum
                              then sumSquare
                              else squareSum

doubleDouble x = (\x -> x*2) (x*2)

counter x = (\x -> (\x -> (x + 1)) (x + 1)) x

ifEven f x = if even x
             then f x
             else x

names = [("A", "Z"),
         ("B", "Y"),
         ("C", "X"),
         ("D", "W")]

cmpLNames n1 n2 = if l1 > l2
                  then GT
                  else if l1 < l2
                       then LT
                       else EQ
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
        nameText = (fst name) ++ " " ++ lastName

nyOffice name = nameText ++ ": New-York 10013"
    where nameText = (fst name) ++ " " ++ (snd name)

rnOffice name = nameText ++ " Rino 89523"
    where nameText = (fst name) ++ " " ++ (snd name)

wsOffice name = "Dear " ++ nameText ++ " Wash 89523"
    where nameText = (fst name) ++ " " ++ (snd name)

getLocationFunction location =
    case location of
        "sf" -> sfOffice
        "ny" -> nyOffice
        "rn" -> rnOffice
        "ws" -> wsOffice
        _ -> (\name -> (fst name) ++ " " ++ (snd name))

addressLetter name location = locFunc name
    where locFunc = getLocationFunction location



genIfEven f = \x -> ifEven f x
ifEvenInc = genIfEven inc

genIfEvenX x = (\f -> ifEven f x)

getRequestUrl host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

genHostRequestUrl host =
    (\apiKey resource id -> getRequestUrl host apiKey resource id)

getHomaanderRequestUrl = genHostRequestUrl "http://homaander.logogon.ru"
getHomaanderRequestUrl2 = getRequestUrl "http://homaander.logogon.ru"

genHostApiRequestUrl hostGen apiKey =
    (\resource id -> hostGen apiKey resource id)

getHomaanderApiRequestUrl = genHostApiRequestUrl getHomaanderRequestUrl "pcxwp3fhj23"

-- flip - изменяет порядок двух аргументов
substract2 = flip (-) 2

myflip f = \a b -> f b a



arr1 = [5, 3, 5, 6]
val1 = head arr1
arr1_ = tail arr1

arr2 = 4 : 5 : []

arr3 = [5,6] ++ [7,8]

arr4 = [1,2 .. 10]
val4 = arr4 !! 4

arr5 = [3, 7, 5, 4, 3]
findVal  = elem 4 arr5
takeVals = take 5 arr5
dropVals = drop 3 arr5

infinArr = cycle [1]

aa = zip [1,2,3] ["A", "B", "C"]

mySum a b = a + b
tt = 4 `mySum` 4

findGCD a b = if ost == 0
              then b
              else findGCD b ost
    where
        ost = mod a b

myFindGCD a 0 = a
myFindGCD a b = myFindGCD b ost
    where
        ost = mod a b

myTake2 0 _ = []
myTake2 _ [] = []
myTake2 n (x:xs) = x : myTake2 (n - 1) xs

myDrop 0 list = list
myDrop n (x:xs) = myDrop (n - 1) xs

-- Функции высшего порядка

ee = map reverse ["abc", "xyz"]

myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

yy = filter even [1..10]

myRemove f [] = []
myRemove f (x:xs) = if f x
                    then myRemove f xs
                    else x : myRemove f xs

ff = foldl (+) 0 [1..10]

contactAll :: [Char]
contactAll = foldl (++) "" ["A", "B", "C"]

myFoldR _ init [] = init
myFoldR f init (x:xs) = f x res
    where res = myFoldR f init xs

gg = foldr (-) 0 [1,2,3,4]

myElem a list = length res > 0
    where res = filter (\x -> x == a) list

-- ООП

-- Int Integer Double Bool Char String

d = read "6" :: Double

makeTriple :: a -> b -> c -> (a, b, c)
makeTriple a b c = (a, b, c)

type FirstName  = String
type MiddleName = String
type LastName   = String

type Age    = Int
type Height = Int
type Widht  = Int

data Name = Name FirstName LastName
            | NameWithMiddle FirstName MiddleName LastName

data Sex = Male | Female

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

data Patient = Patient Name Sex Age Height Widht BloodType

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l  

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A  = "A"
showABO B  = "B"
showABO AB = "AB"
showABO O  = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _  = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _)  = True
canDonateTo (BloodType B _) (BloodType B _)  = True
canDonateTo _ _ = False

johnDoe :: Patient
johnDoe = Patient (Name "John" "Doe") Male 43 188 92 (BloodType AB Pos)

johnDoe2 :: Patient2

janeSmith :: Patient
janeSmith = Patient (NameWithMiddle "Jane" "Elisabet" "Smith") Female 24 150 40 (BloodType A Neg)


-- patientInfo :: PatientName -> Age -> Height -> String
-- patientInfo patientName age height = name ++ " " ++ ageHeight
--     where name = getFirstName patientName ++ ", " ++ getLastName patientName
--           ageHeight = "(Age: " ++ show age ++ "; Height: " ++ show height ++ "sm)"

data Patient2 = Patient2 {
        name      :: Name,
        sex       :: Sex,
        age       :: Age,
        height    :: Height,
        weight    :: Widht,
        bloodType :: BloodType
    }

johnDoe2 = Patient2 {
        name      = Name "John" "Doe",
        sex       =  Male,
        age       = 43,
        height    = 188,
        weight    = 92,
        bloodType = BloodType AB Pos
    }

getJohnDoe2Age :: Age
getJohnDoe2Age = age johnDoe2
newJohnDoe2 :: Patient2
newJohnDoe2 = johnDoe2 { age = 44 }


data Icream = Vanila | Chocolatle deriving (Show, Eq, Ord)

mySucc :: (Bounded a, Eq a, Enum a) => a -> a
mySucc n = if n == maxBound
           then minBound
           else succ n

class Describable a where
    describe :: a -> String

data SixDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Eq, Ord, Enum)

instance Show SixDie where
    show :: SixDie -> String
    show S1 = "One"
    show S2 = "Two"
    show S3 = "Three"
    show S4 = "Four"
    show S5 = "Five"
    show S6 = "Six"


-- data MyNames = MyNames (String, String) deriving (Show, Eq)
newtype MyNames = MyNames (String, String) deriving (Show, Eq)

instance Ord MyNames where
    compare :: MyNames -> MyNames -> Ordering
    compare (MyNames (a1, b1)) (MyNames (a2, b2)) = compare (b1, a1) (b2, a2)


-- Компазиция

-- import Data.List
myMin :: Ord a => [a] -> a
myMin = head . sort

--import Data.Semigroup

data AA = AA0 | AA1 | AA2 | AA3 deriving (Show, Enum)

instance Semigroup AA where
    (<>) :: AA -> AA -> AA
    (<>) AA1 AA2 = AA3
    (<>) AA2 AA1 = AA3
    (<>) AA2 AA3 = AA1
    (<>) AA3 AA2 = AA1
    (<>) AA1 AA3 = AA2
    (<>) AA3 AA1 = AA2
    (<>)   a AA0 = a
    (<>) AA0   a = a
    (<>) a b = AA0

instance Monoid AA where
    mempty :: AA
    mempty = AA0
    mappend :: AA -> AA -> AA
    mappend = (<>)

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 newL2
    where
        nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = mconcat repeatedL1
        newL2 = cycle l2


-- types parametrs

data Box a = Box a deriving (Show)

warp :: a -> Box a
warp = Box

unwarp :: Box a -> a
unwarp (Box a) = a

data Triple a = Triple a a a deriving (Show)

type Point3D = Triple Double

aPoint :: Point3D
aPoint = Triple 0.1 0.2 0.3

tripleGetX :: Triple a -> a
tripleGetX (Triple x _ _) = x

tripleGetY :: Triple a -> a
tripleGetY (Triple _ x _) = x

tripleGetZ :: Triple a -> a
tripleGetZ (Triple _ _ x) = x

tripleGetList :: Triple a -> [a]
tripleGetList (Triple x y z) = [x, y, z]

tripleTransform :: (a -> a) -> Triple a -> Triple a
tripleTransform f (Triple x y z) = Triple (f x) (f y) (f z) 

data List a = Empty | Cons a (List a) deriving Show


-- Значение и ключ
-- import qualified Data.Map as Map

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

organs :: [Organ]
organs = [Heart, Brain, Brain, Heart, Spleen, Spleen, Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24,30]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

result :: Maybe Organ
result = Map.lookup 7 organCatalog

myList :: Map.Map Int String
myList = Map.fromList [(1, "A"), (2, "B")]

mapMain :: Maybe String
mapMain = do
    a <- Map.lookup 1 myList
    b <- Map.lookup 2 myList
    let c = a ++ b
    return c













































