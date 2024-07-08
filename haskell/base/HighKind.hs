{-# LANGUAGE TypeFamilies #-}

module HighKind where

import Data.Functor.Identity

data Person' f = Person
  { pName :: f String
  , pAge  :: f Int }

type Person = Person' Identity
type MaybePerson = Person' Maybe

-- >>> :t pName
-- >>> :t pName @Identity
-- >>> :t pName @Maybe
-- pName :: Person' f -> f String
-- pName @Identity :: Person' Identity -> Identity String
-- pName @Maybe    :: Person' Maybe -> Maybe String

-- >>> :t runIdentity. pName
-- runIdentity. pName :: Person' Identity -> String


-- "Higher-Kinded Data"
type family HKD f a where
  HKD Identity a = a
  HKD f        a = f a

data Person'' f = Person'
  { pName' :: HKD f String
  , pAge'  :: HKD f Int } 
    -- deriving (Generic)

