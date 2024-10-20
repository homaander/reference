{-# OPTIONS_GHC -Wno-missing-export-lists #-}

module MyLambda where

import Data.List (nub)
import Data.Char (isAlpha)

data Lambda = Var String
            | Lam String Lambda
            | App Lambda Lambda
  deriving Eq

instance Show Lambda where
  show (Var a) = a
  show (Lam x a) = "\\" ++ x ++ "." ++ show a
  show (App a b) =
    case b of
      App _ _ -> showL a ++ "(" ++ show b ++ ")"
      _       -> showL a ++ showL b
    where
      showL l@(Lam _ _) = "(" ++ show l ++ ")"
      showL x           = show x

-- >>> show $ Lam "x" (App (Var "y") (Var "x"))
-- "\\x.yx"

isLambda :: Lambda -> Bool
isLambda (Var a)   = isAlpha $ head a
isLambda (Lam a b) = isAlpha (head a) && isLambda b
isLambda (App a b) = isLambda a && isLambda b

-- Vals
lam01 :: Lambda
lam01 = Lam "x" $ App (Var "x") (App (App (Var "y") (Var "x")) (Var "z"))
lam02 :: Lambda
lam02 = Lam "x" $ Lam "y" $ Var "x"

-- >>> show lam01
-- >>> show lam02
-- >>> isLambda lam02
-- "\\x.x(yxz)"
-- "\\x.\\y.x"
-- True


sub :: Lambda -> [Lambda]
sub l@(Var _)   = [l]
sub l@(Lam _ b) = nub $ [l] <> sub b
sub l@(App a b) = nub $ [l] <> sub a <> sub b

-- >>> sub lam01
-- >>> sub lam02
-- [\x.x(yxz),x(yxz),x,yxz,yx,y,z]
-- [\x.\y.x,\y.x,x]

free :: String -> Lambda -> Bool
free x (Var y) = x == y
free x (Lam a b) = x /= a && free x b
free x (App a b) = free x a || free x b

-- >>> free "z" lam01
-- >>> free "y" lam02
-- True
-- False

bounded :: String -> Lambda -> Bool
bounded _ (Var _) = False
bounded x (Lam a b) = x == a || bounded x b
bounded x (App a b) = bounded x a || bounded x b

-- >>> bounded "z" lam01
-- >>> bounded "y" lam02
-- False
-- True

mnFree :: Lambda -> [String]
mnFree (Var y) = [y]
mnFree (Lam a b) = nub (filter (a /=) (mnFree b))
mnFree (App a b) = nub (mnFree a <> mnFree b)

-- >>> mnFree lam01
-- >>> mnFree lam02
-- ["y","z"]
-- []

mnBounded :: Lambda -> [String]
mnBounded (Var _) = []
mnBounded (Lam a b) = nub $ [a] <> mnBounded b
mnBounded (App a b) = nub $ mnBounded a <> mnBounded b

-- >>> mnBounded lam01
-- >>> mnBounded lam02
-- ["x"]
-- ["x","y"]



