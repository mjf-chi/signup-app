module CodeForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Html exposing (..)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div [] [ div [] [ text ("Enter the code we sent to " ++ model.phone) ]
    , input [ onInput InputCode, value model.code ] []
    , button [ onClick ( submit model ) ] [ text "Complete" ]
    ]



submit : Model -> Msg
submit model =
  if validateCode model.code then
    Msg.ConfirmCode
  else
    Msg.UpdateError "Please add the correct code"



validateCode : String -> Bool
validateCode code =
  if (String.length code) > 0 then
    True
  else
    False
