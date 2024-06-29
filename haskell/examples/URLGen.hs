module URLGen where

type Host = String
type ApiKey = String
type Resource = String
type ResourceId = String
type ApiUrl = String

getRequestUrl :: Host -> ApiKey -> Resource -> ResourceId -> ApiUrl
getRequestUrl host apiKey resource id =
    host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

getMyRequestUrl :: ApiKey -> Resource -> ResourceId -> ApiUrl
getMyRequestUrl  = getRequestUrl "http://homaander.logogon.ru"

getMyApiRequestUrl :: Resource -> ResourceId -> ApiUrl
getMyApiRequestUrl  = getMyRequestUrl "pcxwp3fhj23"

getMyApiItemsRequestUrl :: ResourceId -> ApiUrl
getMyApiItemsRequestUrl  = getMyApiRequestUrl "items"