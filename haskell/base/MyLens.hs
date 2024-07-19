module MyLens where

import Prelude hiding ((.))

data Car = Car {
    cName  :: String
  , cOwner :: User
  }
    deriving Show

data User = User {
    uFirstName :: String
  , uLastName  :: String
  , uAge       :: Int
  }
    deriving Show

data Lens a b = Lens (a -> b) (b -> a -> a)

get_ :: Lens a b -> (a -> b)
get_ (Lens g _) = g

set_ :: Lens a b -> (b -> a -> a)
set_ (Lens _ s) = s

(+.) :: a -> Lens a b -> b
(+.) = flip get_

(.=) :: Lens a b -> (b -> a -> a)
(.=) = set_

(.) :: Lens b c -> Lens a b -> Lens a c
(Lens get1 set1) . (Lens get2 set2) = Lens get set
  where
    get s    = get1 $ get2 s
    set n s  = set2 (set1 n $ get2 s) s


myCar :: Car
myCar = Car {
    cName = "BMW"
  , cOwner = myUser
  }

myUser :: User
myUser = User {
    uFirstName = "Andrew"
  , uLastName  = "X"
  , uAge       = 20
  }

-- >>> :t cName
-- >>> :t cOwner
-- cName :: Car -> String
-- cOwner :: Car -> User

_owner :: Lens Car User
_owner = Lens cOwner (\n s -> s {cOwner = n})

_age :: Lens User Int
_age = Lens uAge (\n s -> s {uAge = n})

-- >>> get_ (_age) (myCar+._owner)
-- >>> set_ (_age) 3 (myCar+._owner)
-- 20
-- User {uFirstName = "Andrew", uLastName = "X", uAge = 3}

-- >>> myCar +. (_age._owner)
-- >>> set_ (_age._owner) 3 myCar
-- 20
-- Car {cName = "BMW", cOwner = User {uFirstName = "Andrew", uLastName = "X", uAge = 3}}
