module DataBifunctor where

import Data.Bifunctor

myC :: (Int, Int)
myC  = (10, 11)

main :: IO ()
main  = do
    let
        res = bimap (+ 1) (+ 10) myC
        a = fst res
        b = snd res
    putStrLn $ show a ++ ", " ++ show b
