{-# LANGUAGE TemplateHaskellQuotes #-}

module Lib where

import Language.Haskell.TH

fstN :: Int -> Q Exp
fstN n = do
  x <- newName "x"
  lamE [tupP $ varP x : replicate (n - 1) wildP] (varE x)

myFst3 :: Q Exp
myFst3 = do
  let k = 3 :: Int
  [| \(x, _, _) -> x + k |]

