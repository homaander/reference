module Test where

-- -----------------------------------------
-- 
-- -----------------------------------------

data GG = GG (Int -> Int)

regGG :: GG -> (Int -> Int)
regGG (GG a) = a

constGG :: GG
constGG = GG $ \_ -> 10

addEToA :: Int -> GG
addEToA a = GG $ \x -> x + a

g :: GG -> (Int -> GG) -> GG
g a f = GG $ \x -> regGG (f (regGG a x)) x

-- -----------------------------------------

data RR = RR (Int -> (Int, Int))

regRR :: RR -> (Int -> (Int, Int))
regRR (RR a) = a

stRR :: Int -> RR
stRR a = RR $ \s -> (a, s)

addSToA :: Int -> RR
addSToA a = RR $ \s -> (a + s, s)

addNToS :: Int -> Int -> RR
addNToS n a = RR $ \s -> (a, s + n)

setS :: Int -> Int -> RR
setS n a = RR $ \s -> (a, n)

(>->) :: RR -> (Int -> RR) -> RR
a0 >-> f = RR $ \s0 ->
    let
        (a1, s1) = regRR a0 s0
        (a2, s2) = regRR (f a1) s1
    in 
        (a2, s2)

-- regRR (stRR 10 >-> addNToS 5 >-> addSToA) 0
-- regRR (stRR 10 >-> \a -> (addNToS a a >-> addSToA >-> addSToA)) 0

-- -----------------------------------------

data MS s a = MS (s -> (a, s))
type MSt = MS Int Int

regMS :: MS s a -> (s -> (a, s))
regMS (MS a) = a

stRR2 :: Int -> MSt
stRR2 a = MS $ \s -> (a, s)

addSToA2 :: Int -> MSt
addSToA2 a = MS $ \s -> (a + s, s)

addNToS2 :: Int -> Int -> MSt
addNToS2 n a = MS $ \s -> (a, s + n)

setS2 :: Int -> Int -> MSt
setS2 n a = MS $ \s -> (a, s + n)

instance Num s => Functor (MS s) where
    fmap f a0 = MS $ \s0 ->
        let 
            (a1, s1) = regMS a0 s0
        in 
            (f a1, s1)

instance Num s => Applicative (MS s) where
    pure a = MS $ \s -> (a, s)
    (MS f) <*> (MS a) = MS $ \s -> 
        let
            (f0, _) = f s
            (a0, _) = a s
        in 
            (f0 a0, s)

instance Num s => Monad (MS s) where
    a0 >>= mf = MS $ \s0 -> 
        let 
            (a1, s1) = regMS a0 s0
            (a2, s2) = regMS (mf a1) s1
        in  
            (a2, s2)
