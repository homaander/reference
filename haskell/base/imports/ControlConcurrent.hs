module ControlConcurrent(main) where
import System.IO
import Control.Concurrent (forkIO, threadDelay)
import Control.Monad (replicateM_)

test1 :: IO ()
test1 = do
  hSetBuffering stdout NoBuffering

  forkIO $ do
    replicateM_ 1000 $ putStr "A"

  replicateM_ 1000 $ putStr "B"

main :: IO ()
main = do
  s <- getLine
  if s == "exit" then
    pure ()
  else do
    forkIO $ setReminder s
    main



setReminder :: String -> IO ()
setReminder str = do
  let t = read str :: Int
  print $ "Set reminder on " <> str <> " sec"
  threadDelay $ t * 10^6
  print "BIP BIP"