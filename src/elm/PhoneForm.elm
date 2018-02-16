module PhoneForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Html exposing (..)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Enter your phone number so we can give you the latest sustainable actions!" ]
    , input [ onInput InputPhone, value model.phone ] []
    , button [ onClick ( submit model ) ] [ text "Confirm Number" ]
    ]



--
-- Validate the phone number
-- Send phone, firstname, and lastname to new user api
--
submit : Model -> Msg
submit model =
  if validatePhone model.phone then
    Msg.CreateTemporaryUser
  else
    Msg.UpdateError "Please add a valid phone number"



validatePhone : String -> Bool
validatePhone phone =
  if (String.length phone) > 0 then
    True
  else
    False
