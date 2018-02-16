module NameForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Html exposing (..)
import Routing exposing (..)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Firstname", onInput InputFirstname, value model.firstname] []
    , input [ placeholder "Lastname", onInput InputLastname, value model.lastname] []
    , button [ onClick ( submit model ) ] [ text "Next" ]
    ]



--
-- Validate the first and last name values
-- Change location to enter phone number
-- 
--
submit : Model -> Msg
submit model =
  if validateNames model.firstname model.lastname then
    Msg.ChangeLocation signupPhonePath
  else
    Msg.UpdateError "Please add a first and last name"



--
-- Confirm first last name are valid
--   First + Last
--     Should have a length greater than 0
--
validateNames : String -> String -> Bool
validateNames firstname lastname =
  if (String.length firstname) > 0 && (String.length lastname) > 0 then
    True
  else
    False
