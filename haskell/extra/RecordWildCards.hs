{-# LANGUAGE RecordWildCards #-}

data Person = Person 
  { name :: String
  , age  :: Int }

data C = C {a :: Int, b :: Int, c :: Int, d :: Int}

f :: Person -> String
f (Person {..}) = "a" ++ name ++ show age

g :: C -> Int
g (C {a = 1, ..}) = b + c + d