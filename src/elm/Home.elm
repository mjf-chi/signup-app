module Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html exposing (..)
import Routing exposing (..)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div [ class "home" ]
    [ div [ class "home-text" ] [ text "Welcome to Blue!" ]
    , button [ onClick (Msg.ChangeLocation signupNamePath)
             , class "signupButton"
             ] [ text "Sign up" ]
    ]
