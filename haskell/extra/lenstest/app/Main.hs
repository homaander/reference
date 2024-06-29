{-# LANGUAGE RankNTypes #-}
module Main (main) where

import Control.Lens

import Control.Monad
import Control.Monad.Trans.Class
import Control.Monad.Trans.State

import Lib

myScore :: Lens' Game Int
myScore = lens _score (\game v -> game { _score = v })

-- >>> startCfg^.boss.hp
-- 500
startCfg :: Game
startCfg = Game 
  { _score = 0
  , _units = 
      [ Unit 100 (Point 3 3.5)
      , Unit 150 (Point 4.1 3)
      ]
  , _boss = Unit 500 (Point 0 0)
  }

-- >>> newCgf <- execStateT strike startCfg
-- >>> newCgf^.boss.hp
-- 490
strike :: StateT Game IO ()
strike = do
    lift $ putStrLn "*shink*"
    boss . hp -= 10

-- >>> toListOf partyHP startCfg
-- >>> startCfg ^.. partyHP
-- [100,150]
-- [100,150]
partyHP :: Traversal' Game Int
partyHP = units.traversed.hp

-- >>> newCgf <- execStateT (fireBreath >> fireBreath) startCfg
-- >>> newCgf ^.. partyHP
-- [94,144]
fireBreathAll :: StateT Game IO ()
fireBreathAll = do
    lift $ putStrLn "*rawr*"
    partyHP -= 10

aroundFilter :: Point -> Double -> Unit -> Bool
aroundFilter center radius unit = uX^2 + uY^2 < radius^2 
  where
    uX = unit^.pos.x - center^.x
    uY = unit^.pos.y - center^.y


around :: Point -> Double -> Traversal' Unit Unit
around center radius = filtered (aroundFilter center radius)

fireBreathR :: Point -> StateT Game IO ()
fireBreathR target = do
    lift $ putStrLn "*rawr*"
    units.traversed.(around target 1.5).hp -= 3

-- >>> startCfg^..units.traversed.pos
-- [Point {_x = 0.0, _y = 0.0},Point {_x = 0.1, _y = 0.0}]
-- >>> newCgf <- execStateT (fireBreathR (Point 1 0)) startCfg
-- >>> newCgf ^.. partyHP
-- [97,147]
retreat :: StateT Game IO ()
retreat = do
    lift $ putStrLn "Retreat!"
    zoom (units.traversed.pos) $ do
        x += 1
        y += 1

-- >>> battleEnd <- execStateT battle startCfg
-- >>> battleEnd^.boss
-- Unit {_hp = 470, _pos = Point {_x = 3.3000000000000003, _y = 3.3000000000000003}}
battle :: StateT Game IO ()
battle = do
    -- Зарядить!
    forM_ ["Take that!", "and that!", "and that!"] $ \taunt -> do
        lift $ putStrLn taunt
        strike

    -- Дракон просыпается!
    fireBreathR (Point 1 1)
    fireBreathR (Point 2 2)
    fireBreathR (Point 3 3)

    fireBreathAll

    -- настоящее мужество!
    replicateM_ 3 $ do
        retreat

        zoom (boss.pos) $ do
            x += 1.1
            y += 1.1

main :: IO ()
main = do
    battleEnd <- execStateT battle startCfg
    print $ battleEnd^.units
