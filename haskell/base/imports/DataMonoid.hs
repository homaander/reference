module Test where

import Data.Monoid

dualt :: Dual String
dualt = Dual "a" <> Dual "b" <> Dual "c"

-- >>> getDual dualt
-- "cba"

endot :: Endo Int
endot = Endo (+1) <> Endo (*8) <> Endo (3-)


-- >>> appEndo endot 1
-- 17

allt :: All
allt = All True <> All False <> All True

-- >>> getAll allt
-- False

anyt :: Any
anyt = Any True <> Any False <> Any True

-- >>> anyt
-- >>> getAny anyt
-- Any {getAny = True}
-- True
