module Main (main) where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC
import Network.HTTP.Simple
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.Encoding as TE

apiFile, apiHost, apiPath :: B.ByteString

apiHost = "raw.githubusercontent.com"
apiPath = "/homaander/reference/master/"
apiFile = "README.md"

buildRequest :: BC.ByteString -> BC.ByteString -> BC.ByteString -> Request
buildRequest h p f = 
    setRequestMethod "GET"
    $ setRequestHost h
    $ setRequestPath (p <> f)
    $ setRequestSecure True
    $ setRequestPort 443
    defaultRequest

request :: Request
request = buildRequest apiHost apiPath apiFile

main :: IO ()
main = do
    -- response <- httpLBS $ "https://raw.githubusercontent.com/homaander/reference/master/README.md"
    response <- httpLBS request
    let status = getResponseStatusCode response
    if  status == 200
        then do
            let body = getResponseBody response
            putStrLn $ (T.unpack (TE.decodeUtf8 body))
        else
            print ("Err" :: String)
