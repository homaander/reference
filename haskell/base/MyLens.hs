module MyLens where

import Prelude (Int, String, Show, ($))

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

lGet :: forall a b. Lens a b -> (a -> b)
lGet (Lens g _) = g

lSet :: forall a b. Lens a b -> (b -> a -> a)
lSet (Lens _ s) = s

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

myLensUser :: Lens Car User
myLensUser = Lens cOwner (\n s -> s {cOwner = n})

myLensAge :: Lens User Int
myLensAge = Lens uAge (\n s -> s {uAge = n})

-- lGet (myLensAge) myUser
-- lSet (myLensAge) 3 myUser

-- lGet (myLensAge . myLensUser) myCar 
-- lSet (myLensAge . myLensUser) 3 myCar