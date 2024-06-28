module CtrlArrow where

import Control.Arrow
import qualified Control.Category as Ctg

newtype MyArrow a b = MyArrow {
    runMyArrow :: a -> b
    }

instance Ctg.Category MyArrow where
    id :: MyArrow a a
    id = arr id

    (.) :: MyArrow b c -> MyArrow a b -> MyArrow a c
    (.) (MyArrow g) (MyArrow f) = MyArrow (g . f)

instance Arrow MyArrow where
    arr :: (b -> c) -> MyArrow b c
    arr = MyArrow

    first :: MyArrow b c -> MyArrow (b, d) (c, d)
    first (MyArrow f) = MyArrow (genFirst f)
      where
        genFirst f (a,b) = (f a, b)

instance ArrowChoice MyArrow where
    left :: MyArrow a b -> MyArrow (Either a d) (Either b d)
    left (MyArrow f) = MyArrow (genLeft f)
      where
        genLeft f (Left  x) = Left  (f x)
        genLeft f (Right x) = Right x


arrowTestX :: MyArrow Int Int
arrowTestX  = arr (\x -> 50 * x + 20)

arrowTestY :: MyArrow Int Int
arrowTestY  = arr (\y -> 50 * y + 15)


-- * Arrow
-- ? Применить только к 1 аргументу
runArrowTestX :: Int -> Int -> (Int, Int)
runArrowTestX x y = runMyArrow (first arrowTestX) (x, y)

-- ? Скомбинировать для X и Y
runArrowTestXY :: Int -> Int -> (Int, Int)
runArrowTestXY x y = runMyArrow (arrowTestX *** arrowTestY) (x, y)

-- ? Скопировать X и применить 2 функции
runArrowTestXX :: Int -> (Int, Int)
runArrowTestXX  = runMyArrow (arrowTestX &&& arrowTestX)

-- ? Комбинирование
arrowTestCombine :: MyArrow (Int, Int) (Int, Int)
arrowTestCombine =
    first arrowTestX >>>
    arrowTestX *** arrowTestY

runArrowTestCombine :: (Int, Int)
runArrowTestCombine = 
    runMyArrow arrowTestCombine (3, 4)


-- * ArrowChoice
-- ? Если Left (то-есть число) то применяем функцию
runArrowChTestX :: Either Int String -> Either Int String
runArrowChTestX  = runMyArrow (left arrowTestX)

-- ? Выполнить функции для Left и Right
runArrowChTestXM :: MyArrow (Either Int String) (Either Int String)
runArrowChTestXM  = arrowTestX +++ arr (++ " OK!")

runArrowChTestXM', runArrowChTestXM'' :: Either Int String
runArrowChTestXM'  = runMyArrow runArrowChTestXM (Left 11)
runArrowChTestXM'' = runMyArrow runArrowChTestXM (Right "Msg")

-- ? Выполнить функции для Left и Right, но результат без контейнера (тип результат одинаковый)
-- ? Так-же можно понимать как "удаление Either"
runArrowChTestXY :: MyArrow (Either Int Int) Int
runArrowChTestXY  = arrowTestX ||| arrowTestY

runArrowChTestXY',runArrowChTestXY'' :: Int
runArrowChTestXY'  = runMyArrow runArrowChTestXY (Left 1)
runArrowChTestXY'' = runMyArrow runArrowChTestXY (Right 1)


-- * ArrowApply - содержит значение app, как  MyArrow (MyArrow b c, b) c 
-- *   помогает реализовать Monad
-- ?   arr (\(f, x) -> f x)


-- * Kleisli - монадическая стрелка со всеми вышеописанными классами
-- ?  newtype Kleisli m a b = Kleisli {
-- ?      runKleisli :: (a -> m b) 
-- ?      }

plusminus, double, h2 :: Kleisli [] Int Int
plusminus = Kleisli (\x -> [x, 2 * x])
double    = arr (* 2)
h2        = liftA2 (+) plusminus double

h2Output :: [Int]
h2Output  = runKleisli h2 8

main :: IO ()
main = do
    let
        xs = do
           list <- ["test", "foobar"]
           runKleisli xform list

        xform = withId (prepend "<") >>>
                withId (append  ">") >>>
                withId (prepend "!"  >>> append "!")

        withId  t = returnA <+> t
        prepend x = arr (x ++)
        append  x = arr (++ x)

    mapM_ putStrLn xs