module URLGen where

getRequestUrl :: [Char] -> [Char] -> [Char] -> [Char] -> [Char]
getRequestUrl host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

genHostRequestUrl :: [Char] -> [Char] -> [Char] -> [Char] -> [Char]
genHostRequestUrl host =
    (\apiKey resource id -> getRequestUrl host apiKey resource id)

getHomaanderRequestUrl :: [Char] -> [Char] -> [Char] -> [Char]
getHomaanderRequestUrl = genHostRequestUrl "http://homaander.logogon.ru"

getHomaanderRequestUrl2 :: [Char] -> [Char] -> [Char] -> [Char]
getHomaanderRequestUrl2 = getRequestUrl "http://homaander.logogon.ru"

genHostApiRequestUrl :: ([Char] -> [Char] -> [Char] -> [Char]) -> [Char] -> [Char] -> [Char] -> [Char]
genHostApiRequestUrl hostGen = hostGen

getHomaanderApiRequestUrl :: [Char] -> [Char] -> [Char]
getHomaanderApiRequestUrl = genHostApiRequestUrl getHomaanderRequestUrl "pcxwp3fhj23"