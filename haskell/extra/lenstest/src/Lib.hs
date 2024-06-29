{-# LANGUAGE TemplateHaskell #-}

module Lib where

import Control.Lens

data Game = Game 
  { _score :: Int
  , _units :: [Unit]
  , _boss  :: Unit
  }
    deriving Show

data Unit = Unit
  { _hp  :: Int
  , _pos :: Point
  }
    deriving Show

data Point = Point
  { _x :: Double
  , _y :: Double
  }
    deriving Show


makeLenses 'Game
makeLenses 'Unit
makeLenses 'Point
