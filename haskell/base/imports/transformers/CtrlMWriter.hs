module CtrlMWriter where
import  Control.Monad.Trans.Writer

-- Первый аргумент - сам буфер, должен быть членом класса Monoid

myVal :: Writer String Int
myVal  = writer (2, "")

myMain :: Writer [String] Int
myMain  = do
    tell ["First"]
    tell ["Second"]
    return 4

-- Сохраняет значение и лог функции в значение функции, лог остается без изменений
-- listen myMain

main :: IO ()
main  = do
    let
        all = runWriter myMain
        msg = execWriter myMain
    putStrLn "Test Writer:"
    putStrLn $ "->  All " ++ show all
    putStrLn $ "->  Msg " ++ show msg