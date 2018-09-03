module Main exposing (..)

import Navigation
import Msg exposing (..)
import Routing
import Update exposing (update)
import View exposing (view)
import Models exposing (..)


main : Program Never Model Msg
main =
  Navigation.program Msg.OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }



init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  let
    currentRoute =
      Routing.parseLocation location

  in
    ( initialModel currentRoute, Cmd.none )


