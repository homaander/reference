module Main where

-- import Control.Parallel.Strategies

-- import Control.Exception
-- import Control.Monad
-- import Data.Time.Clock
-- import Text.Printf


import EvalTest
import ParTest
-- import CoreCalc

-- cabal run exes -- -O2 +RTS -s -l -N2
main :: IO ()
main = do
  -- testEval
  print testPar2

-- >>