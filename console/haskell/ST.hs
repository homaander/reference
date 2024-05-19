module ST where

import Control.Monad.ST
import Data.STRef

t_in_do = do
    ref <- newSTRef "hello"
    x   <- readSTRef ref
    writeSTRef ref (x ++ "world")
    readSTRef ref

t1 = runST $ t_in_do

t2 = runST $ newSTRef "hello" >>= \ref -> (readSTRef ref >>= \x -> (writeSTRef ref (x ++ "world") >>= const (readSTRef ref)))