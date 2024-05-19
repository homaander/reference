import Control.Arrow
import qualified Control.Category as C

newtype SimpleFunc a b = SimpleFunc {
    runF :: (a -> b)
  }

instance Arrow SimpleFunc where
  arr func = SimpleFunc func
  first (SimpleFunc func) = SimpleFunc (mapFst func)
    where mapFst func (a,b) = (func a, b)
  second (SimpleFunc func) = SimpleFunc (mapSnd func)
    where mapSnd func (a,b) = (a, func b)

instance C.Category SimpleFunc where
  (.) (SimpleFunc g) (SimpleFunc f) = SimpleFunc (g . f)
  id = arr id

---

-- newtype Kleisli m a b = Kleisli {
--   runKleisli :: (a -> m b) 
-- }

plusminus, double, h2 :: Kleisli [] Int Int

plusminus = Kleisli (\x -> [x, -x])
double    = arr (* 2)
h2        = liftA2 (+) plusminus double 

h2Output :: [Int]
h2Output = runKleisli h2 8

main :: IO ()
main = do
   let
       prepend x = arr (x ++)
       append  x = arr (++ x)
       withId  t = returnA <+> t
       xform = (withId $ prepend "<")   >>>
               (withId $ append  ">")   >>>
               (withId $ ((prepend "!") >>> (append "!")))
       xs = ["test", "foobar"] >>= (runKleisli xform)
   mapM_ putStrLn xs