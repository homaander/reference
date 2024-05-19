-- Имя модуля
module Syntax where
-- Имя модуля и операции на экспорт (без скобок = всё)
-- module Syntax(A, B, C)

--
-- import EmptyModule

--
-- import Sub.SubMos

--
-- import Prelude (Bool(..), Show(..), Eq(..))

-- Типы
-- v :: Int                     |
-- v :: Bool                    |
-- v :: [Int] -> [Int]          |
-- v :: a -> a                  |
-- v :: Num a => a -> a         | Тип должен быть из класса Num
-- v :: (A a, B a) => a -> a    | Тип должен быть из этих классов


-- Новый тип
data A1 = I | O
data A2 = A2 A1 A1

data B1            = I1 Int | O1 Int
data B2 a          = I2 a | O2 a
data B3 Num a => a = I3 a | O3 a

data С1 = С1 {
    age  :: Int
    name :: String
}

hh :: С1
hh = С1 { name = "Haha", age = 10 }


-- Синоним типа
type NA = A1
type NB = B2 Int


-- Синонимы
t1 :: A1
t1 = I

t0 :: A1
t0 = O

tI :: A2
tI = A2 I I

tO :: A2
tO = A2 O O

tN :: A1 -> A1
tN I = O
tN O = I

tAnd :: A1 -> A1 -> A1
tAnd O _ = O
tAnd I x = x

tOr :: A1 -> A1 -> A1
tOr I _ = I
tOr O x = x


-- Классы типов
-- Авто наследование определённых классов
data C = HH | OO 
    deriving (Show, Eq)

-- Создание класса
class A a where
    add :: a -> Int -> Int
    mul :: a -> Int -> Int

-- Типы дл класса B должны быть и в A (A = суперкласс)
class A a => B a where
    ii :: a -> Int -> Int

-- Определение стандартного класса
instance Show A1 where
    show I = "First"
    show O = "Second"

-- определение методов класса дл разных типов
instance A A1 where
    add I x = 1 + x
    add O x = 2 + x

    mul I x = 2 * x
    mul O x = 4 * x

instance A A2 where
    add (A2 _ I) b = 1 + b
    add (A2 _ 0) b = 2 + b

    mul (A2 _ I) b = 2 * b
    mul (A2 _ O) b = 4 * b

plus :: Int -> Int -> Int
plus a b = a + b

test :: Mt a => a -> Int
test a = 1

testF :: (Num a) => a -> a -> a
testF a b = a + b

-- 
mystate = a >>= \x -> b x >>= c

-- ... do style
main :: IO()
main = do
    let a = FF
    let b = CC 10
    let c = HH
    let d = DD 10 10

    print $ tt 5