import System.IO

main :: IO ()
main = do
    myFile <- openFile "hello.txt" ReadMode
    firstLine <- hGetLine myFile
    putStrLn firstLine
    secondLine <- hGetLine myFile
    resultFile <- openFile "goodbye.txt" WriteMode
    hPutStrLn resultFile secondLine
    hClose resultFile
    putStrLn "OK!"