{-# LANGUAGE GADTs #-}

module LanguageGADT (Term(..), eval) where
-- import Data.Kind

data Term a where
    Lit    :: Int -> Term Int
    Succ   :: Term Int -> Term Int
    IsZero :: Term Int -> Term Bool
    If     :: Term Bool -> Term a -> Term a -> Term a
    Pair   :: Term a -> Term b -> Term (a,b)

eval :: Term a -> a
eval (Lit i)     = i
eval (Succ i)    = eval i + 1
eval (IsZero i)  = eval i == 0
eval (If a b c)  = if eval a then eval b else eval c
eval (Pair a b)  = (eval a, eval b)

-- >>> eval $ Pair (Succ $ Succ $ Lit 1) (Lit 2)
-- (3,2)

