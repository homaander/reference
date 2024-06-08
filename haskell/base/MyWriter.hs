module MyWriter where
import Control.Monad.Writer

myVal :: Writer String Int
myVal = writer (2, "")

myMain :: Writer String Int
myMain = do
    tell "Ok"
    return 4

main :: IO ()
main = do
    let
        all = runWriter myMain
    putStrLn "Test Writer:"
    putStrLn $ "->  All " ++ show all