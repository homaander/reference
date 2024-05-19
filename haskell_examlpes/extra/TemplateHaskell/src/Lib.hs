{-# LANGUAGE TemplateHaskellQuotes #-}

module Lib where

import Language.Haskell.TH
import Language.Haskell.TH.Quote
import Data.List

makeLookupFun :: String -> Q [Dec]
makeLookupFun prefix = do
  let funNameStr = prefix ++ "Lookup"
  d <- [d|
      userLookup :: Int -> LookupStatus -> IO ()
      userLookup uid =
        genericLookup ["test", "application", funNameStr, show uid]
    |]
  -- report False (show d)
  let funName = mkName funNameStr
      [SigD _ funSig, FunD _ funBody] = d
      d' = [SigD funName funSig, FunD funName funBody]
  return d'

makeLookupFunctions' :: [String] -> Q [Dec]
makeLookupFunctions' prefixList = do
  lst <- mapM makeLookupFun prefixList
  return $ concat lst

makeLookupFunctions =
  QuasiQuoter
  { quoteDec  = makeLookupFunctions'.words
  , quoteExp  = undefined
  , quotePat  = undefined
  , quoteType = undefined
  }

data LookupStatus = Ok | Warning | Error | Unknown
          deriving (Eq, Show)

genericLookup :: [String] -> LookupStatus -> IO ()
genericLookup path st =
  putStrLn $ intercalate "/" path ++ " = " ++ show st
