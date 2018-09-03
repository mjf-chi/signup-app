module Models exposing (..)

import Navigation exposing (Location)



type Route
  = Home
  | EnterName
  | EnterZip
  | EnterPhone
  | EnterCode
  | ThankYou
  | NotFoundRoute



type alias Model =
  { history : List Route
  , route : Route
  , changes : Int
  , firstname : String
  , lastname : String
  , zipcode : String
  , phone : String
  , code : String
  , error : String
  , loading : Bool
  , httpResponse : String
  }



type alias ApiResponse =
  { status: Int
  , message: String
  , created: Int
  , error: String
  }



initialModel : Route -> Model
initialModel route =
  { history = [Home]
  , route = route
  , changes = 0
  , firstname = ""
  , lastname = ""
  , zipcode = ""
  , phone = ""
  , code = ""
  , error = ""
  , loading = False
  , httpResponse = ""
  }

