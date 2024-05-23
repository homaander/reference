{-# LANGUAGE RecordWildCards #-}

data Person = Person {
    name :: String
  , age :: Int
  }

myf :: Person -> String
myf (Person {..}) = "a" ++ name ++ show age

data C = C {a :: Int, b :: Int, c :: Int, d :: Int}
f (C {a = 1, ..}) = b + c + d