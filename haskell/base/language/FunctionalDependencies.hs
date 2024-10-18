-- For "a b" in class
{-# LANGUAGE MultiParamTypeClasses #-}
-- For "| a -> b" to set assoc
{-# LANGUAGE FunctionalDependencies #-}
-- For use fixed type in class
{-# LANGUAGE AllowAmbiguousTypes #-}
-- For use @Int
{-# LANGUAGE TypeApplications #-}
-- For @a
{-# LANGUAGE ScopedTypeVariables #-}
-- For set kind of types :: Type -> Type
{-# LANGUAGE KindSignatures #-}
-- Values to Kind
{-# LANGUAGE DataKinds #-}
-- For "forall a. a"
{-# LANGUAGE RankNTypes #-}
-- 
{-# LANGUAGE InstanceSigs #-}

module FunctionalDependencies where
import GHC.TypeLits

data LL = AA | BB

class A a where
  getl :: Int

instance A Int where
  getl = 40

instance A LL where
  getl = 20

class G (n :: Nat) a | n -> a where
  getg :: Int

instance G 1 LL where
  getg = 40

instance G 2 LL where
  getg = 40

instance G 3 Int where
  getg = 50

aa = getg @1




-- >>> getg @3
-- 50

