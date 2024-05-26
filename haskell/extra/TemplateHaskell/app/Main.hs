{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import Lib

-- makeLookupFunctions' ["user", "topic", "post"]
makeLookupFunctions' ["user", "topic", "post"]

main = do
  userLookup 123 Ok
  topicLookup 456 Warning
  postLookup 789 Error