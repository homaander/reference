import Test.QuickCheck
import Lib

prop_mySuperFunctionF :: Int -> Bool
prop_mySuperFunctionF a = mySuperFunction a (-1000) == -990

prop_mySuperFunctionS :: Int -> Bool
prop_mySuperFunctionS a = mySuperFunction 1000 a == a + 10

main :: IO ()
main = do
    quickCheck prop_mySuperFunctionF
    quickCheck prop_mySuperFunctionS
    putStrLn "Test suite not yet implemented"
