module Main (main) where

import Control.Monad

import Control.Monad.ST
import Data.STRef

import Data.Array.Unboxed
import Data.Array.ST

zeroIndexArray :: UArray Int Bool
zeroIndexArray = array (0, 9) [(3, True)]

oneIndexArray :: UArray Int Bool
oneIndexArray = array (1, 10) $ zip [0 .. 3] $ repeat True

beansInBuckets :: UArray Int Int
beansInBuckets = array (0, 3) []

updatedBiB :: UArray Int Int
updatedBiB = beansInBuckets // [(1, 5), (3, 6)]
-- accum (+) updatedBiB $ zip [0 .. 3] $ cycle [2]

listToSTUArray :: [Int] -> ST s (STUArray s Int Int)
listToSTUArray vals = do
    let end = length vals - 1
    myArray <- newArray (0, end) 0
    forM_ [0 .. end] $
        \i -> do
            let val = vals !! i
            writeArray myArray i val
    return myArray

listToUArray :: [Int] -> UArray Int Int
listToUArray vals = runSTUArray $ do
        let end = length vals - 1
        myArray <- newArray (0, end) 0
        forM_ [0 .. end] $
            \i -> do
                let val = vals !! i
                writeArray myArray i val
        return myArray

swapST :: (Int, Int) -> (Int, Int)
swapST (x, y) = runST $ do
    x' <- newSTRef x
    y' <- newSTRef y
    writeSTRef x' y
    writeSTRef y' x
    resx <- readSTRef x'
    resy <- readSTRef y'
    return (resx, resy)

myData :: UArray Int Int
myData = listArray (0, 5) [7, 6, 4, 8, 10, 2]

bubbleSort :: UArray Int Int -> UArray Int Int
bubbleSort myArray = runSTUArray $ do
    stArray <- thaw myArray
    let end = (snd . bounds) myArray
    forM_ [1 .. end] $ \i -> do
        forM_ [0 .. (end - i)] $ \j -> do
            val     <- readArray stArray j
            nextval <- readArray stArray (j + 1)
            when (val > nextval) $ do
                writeArray stArray j nextval
                writeArray stArray (j + 1) val
    return stArray

main :: IO ()
main = print (myData)
