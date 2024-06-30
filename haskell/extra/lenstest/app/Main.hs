{-# LANGUAGE RankNTypes #-}
module Main (main) where

import Control.Lens

import Control.Monad
import Control.Monad.Trans.Class
import Control.Monad.Trans.State

import Lib

startCfg :: Game
startCfg = Game 
  { _score = 0
  , _units = 
      [ Unit 100 (Point 3 3.1)
      , Unit 150 (Point 3 3)
      ]
  , _boss = Unit 500 (Point 0 0)
  }

-- * Получение информации через линзы:
-- >>> startCfg^.boss.hp
-- 500

-- * Выполнить действие и получить результат
-- >>> newCgf <- execStateT strike startCfg
-- >>> newCgf^.boss.hp
-- 490
strike :: StateT Game IO ()
strike = do
    lift $ putStrLn "*shink*"
    boss . hp -= 10

-- * Получить свойство из свойства списка
-- >>> toListOf partyHP startCfg
-- >>> startCfg^..(units.traversed.pos)
-- [100,150]
-- [Point {_x = 3.0, _y = 3.1},Point {_x = 3.0, _y = 3.0}]
partyHP :: Traversal' Game Int
partyHP = units.traversed.hp

-- * Так же можно изменять свойства одновременно
-- >>> newCgf <- execStateT (fireBreathAll >> fireBreathAll) startCfg
-- >>> newCgf^..partyHP
-- [80,130]
fireBreathAll :: StateT Game IO ()
fireBreathAll = do
    lift $ putStrLn "*rawr*"
    partyHP -= 10

-- * Отфильтровать после получения всех свойств
-- >>> newCgf <- execStateT (fireBreathR (Point 1 0)) startCfg
-- >>> newCgf^..partyHP
-- [97,147]
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
    let
        inRadius = around target 1.5

    units.traversed.inRadius.hp -= 3

-- * Перейти вниз по свойствам и редактировать их
-- >>> newCgf <- execStateT (retreat) startCfg
-- >>> startCfg^..units.traversed.pos
-- >>> newCgf^..units.traversed.pos
-- [Point {_x = 3.0, _y = 3.1},Point {_x = 3.0, _y = 3.0}]
-- [Point {_x = 4.0, _y = 4.1},Point {_x = 4.0, _y = 4.0}]
retreat :: StateT Game IO ()
retreat = do
    lift $ putStrLn "Retreat!"
    zoom (units.traversed.pos) $ do
        x += 1
        y += 1

-- * Комбинируем все
-- >>> battleEnd <- execStateT battle startCfg
-- >>> battleEnd^.boss
-- Unit {_hp = 470, _pos = Point {_x = 3.75, _y = 3.75}}
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

    -- Настоящее мужество!
    replicateM_ 3 $ do
        retreat
        zoom (boss.pos) $ do
            x += 1.25
            y += 1.25

main :: IO ()
main  = do
    battleEnd <- execStateT battle startCfg
    print $ battleEnd^.units
