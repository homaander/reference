module RFunctor where

data Pair a = Pair a a | NotPair

type IntPair = Pair Int

instance Functor Pair where
  fmap :: (a -> b) -> Pair a -> Pair b
  fmap f (Pair a b) = Pair (f a) (f b)
  fmap _ NotPair = NotPair

class MyShow a where
  myshow :: a -> String

instance MyShow IntPair where
  myshow :: Pair Int -> String
  myshow (Pair a b) = show a
