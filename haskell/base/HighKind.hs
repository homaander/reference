module HighKind where

import Data.Functor.Identity

data Person' f = Person
  { pName :: f String
  , pAge  :: f Int
  }

type Person = Person' Identity
type MaybePerson = Person' Maybe

-- >>> :t pName @Identity
-- pName @Identity :: Person' Identity -> Identity String

-- >>> :t runIdentity . pName
-- runIdentity . pName :: Person' Identity -> String
