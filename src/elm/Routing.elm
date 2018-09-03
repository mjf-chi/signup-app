module Routing exposing (..)

import Navigation exposing (Location)
import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Navigation exposing (Location)
import Models exposing (Route(..))
import UrlParser exposing (..)
import Json.Decode as Decode


-- List of routes to look for in the browser path
--
matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ UrlParser.map Home top
    , UrlParser.map Home (s "signup")
    , UrlParser.map EnterName (s "name")
    , UrlParser.map EnterZip (s "zipcode")
    , UrlParser.map EnterPhone (s "phone")
    , UrlParser.map EnterCode (s "confirm")
    , UrlParser.map ThankYou (s "complete")
    ]



parseLocation : Location -> Route
parseLocation location =
  case (parsePath matchers location) of
    Just route ->
      route

    Nothing ->
      NotFoundRoute



onLinkClick : msg -> Attribute msg
onLinkClick message =
  let
    options =
      { stopPropagation = False
      , preventDefault = True
      }
  in
    onWithOptions "click" options (Decode.succeed message)



homePath : String
homePath =
  "/"


signupNamePath : String
signupNamePath =
  "name"


signupZipcodePath : String
signupZipcodePath =
  "zipcode"


signupPhonePath : String
signupPhonePath =
  "phone"


signupCodePath : String
signupCodePath =
  "confirm"


thankyouPath : String
thankyouPath =
  "complete"

