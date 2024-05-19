{-# LANGUAGE TemplateHaskellQuotes #-}

module QQ(myqq) where

import Language.Haskell.TH
import Language.Haskell.TH.Quote

myqq  :: QuasiQuoter
myqq  =  QuasiQuoter 
  { quoteExp  = quoteExprExp
  , quotePat  = undefined
  , quoteType = undefined
  , quoteDec  = undefined
  }

quoteExprExp :: String -> Q Exp
quoteExprExp str = if length str > 8
  then [| reverse str |]
  else [| str |]