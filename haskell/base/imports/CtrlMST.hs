module CtrlMST where

import Data.STRef
import Data.Maybe
import Data.Either

import Control.Monad
import Control.Monad.ST
import Debug.Trace

sumST :: Num a => [a] -> a
sumST xs = runST $ do           -- runST takes out stateful code and makes it pure again.

    n <- newSTRef 0             -- Create an STRef (place in memory to store values)

    forM_ xs $ \x -> do         -- For each element of xs ..
        modifySTRef n (+x)      -- add it to what we have in n.

    readSTRef n                 -- read the value of n, and return it.

foldlST :: (a -> b -> a) -> a -> [b] -> a
foldlST f acc xs = runST $ do
    acc' <- newSTRef acc            -- Create a variable for the accumulator

    forM_ xs $ \x -> do             -- For each x in xs...

        a <- readSTRef acc'         -- read the accumulator
        writeSTRef acc' (f a x)     -- apply f to the accumulator and x

    readSTRef acc'                  -- and finally read the result

fibST :: Integer -> Integer
fibST n = 
    if n < 2
    then n
    else runST $ do
        x <- newSTRef 0
        y <- newSTRef 1
        fibST' n x y

    where fibST' 0 x _ = readSTRef x
          fibST' n x y = do
              x' <- readSTRef x
              y' <- readSTRef y
              writeSTRef x y'
              writeSTRef y $! x'+y'
              fibST' (n-1) x y



data MList s a = MList {
                         mlen :: STRef s Int
                       , mhead :: STRef s (Maybe (Node s a))
                       }

data Node s a = Node {
                       val :: STRef s a
                     , next :: STRef s (Maybe (Node s a))
                     }

-- >>> empty
-- <<ST action>>

instance MonadFail (ST s) where
    fail s = errorWithoutStackTrace s

empty :: ST s (MList s a)
empty  = MList <$> newSTRef 0 <*> newSTRef Nothing

prepend :: a -> MList s a -> ST s ()
prepend a (MList len lhead) =
  do
    old    <- readSTRef lhead
    lhead' <- newSTRef old
    newe   <- newSTRef a
    modifySTRef len (+1)
    writeSTRef lhead (Just $ Node newe lhead')

toList :: ST s (MList s a) -> ST s [a]
toList sl =
  do
    (MList cr nr) <- sl
    c   <- readSTRef cr
    nr' <- readSTRef nr
    if c == 0
    then return []
    else go $ fromJust nr'
  where
    go :: Node s a -> ST s [a]
    go (Node vr nr) =
      do
        n <- readSTRef nr
        v <- readSTRef vr
        if isNothing n
        then return [v]
        else (v:) <$> go (fromJust n)


get_ :: MList s a -> Int -> ST s (Either String (Node s a))
get_ l i | i < 0 = return $ Left "Index < 0"
         | otherwise =
             do
               c <- readSTRef $ mlen l
               nr <- readSTRef $ mhead l
               if i >= c
               then return $ Left "Insex > Max"
               else go (fromJust nr) i
  where
    go n 0 = return $ Right n
    go n i =
      do
        nn <- readSTRef $ next n
        go (fromJust nn) (i - 1)

get :: MList s a -> Int -> ST s a
get l i =
  do
    r <- get_ l i
    if isLeft r
    then error $ fromLeft undefined r
    else readSTRef $ val $ fromRight undefined r

insert :: MList s a -> Int -> a -> ST s ()
insert l 0 v = prepend v l
insert l@(MList c _) i v =
  do
    when (i < 0) $ return $! error "Index < 0"                
    size <- readSTRef c
    when (i > size) $ return $! error "Index > Max"
    (Right (Node _ nr)) <- get_ l (i - 1)                    
    nn <- get_ l i
    nrp <- newSTRef $ if i < size 
                      then Just $ fromRight undefined nn
                      else Nothing
    vr <- newSTRef v
    writeSTRef nr $ Just $ Node vr nrp
    modifySTRef c (+1)

delete :: MList s a -> Int -> ST s ()
delete l i =
  do
    size <- readSTRef $ mlen l
    when (i   <   0) $ return $! error "Index < 0"
    when (size == 0) $ return $! error "List is empty"
    when (i >= size) $ return $! error "Index > Max"
    if i == 0
    then
      do
        (Just (Node _ r)) <- readSTRef $ mhead l
        nn <- readSTRef r
        writeSTRef (mhead l) nn
    else
      do
        (Right (Node _ nr)) <- get_ l i
        nv' <- readSTRef nr
        (Right (Node _ n)) <- get_ l (i - 1)
        writeSTRef n nv'
    modifySTRef (mlen l) (subtract 1)

update :: MList s a -> Int -> a -> ST s ()
update l i v =
  do
    delete l i
    insert l i v

b :: ST s (MList s Integer)
b  =
  do
    l <- empty
    prepend 7 l
    prepend 3 l
    prepend 2 l
    prepend 54 l
    v <- get l 2
    traceM $ show v
    insert l 1 5435
    delete l 3
    update l 2 777
    return l

-- in ghci printed "3"
-- >>> runST $ toList b
-- [54,5435,777,7]

