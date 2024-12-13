{-# LANGUAGE GADTs #-}

module GADTs where
-- import Data.Kind

data Term a where
    Yes    :: Term Bool
    No     :: Term Bool
    Lit    :: Int -> Term Int
    Succ   :: Term Int -> Term Int
    IsZero :: Term Int -> Term Bool
    If     :: Term Bool -> Term a -> Term a -> Term a
    Pair   :: Term a -> Term b -> Term (a,b)

eval :: Term a -> a
eval Yes         = True
eval No          = False
eval (Lit i)     = i
eval (Succ i)    = eval i + 1
eval (IsZero i)  = eval i == 0
eval (If a b c)  = if eval a then eval b else eval c
eval (Pair a b)  = (eval a, eval b)

main :: IO ()
main = do
  print . eval $ Pair (If No (Succ (Lit 10)) (Lit 10)) (IsZero $ Lit 1)

