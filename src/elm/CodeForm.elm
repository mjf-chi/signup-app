module CodeForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div [ class "form-page" ] [
    div [ class "form-page-container" ]
      [ div [ class "logo-container" ] [
          span [ class "form-page-logo" ] [ text "baloo" ]
          , span [ class "form-page-sublogo" ] [ text "sign up" ]
      ]
      , div [ class "form-page-nav" ] [
          div [ class "form-page-option" ] [ text "Name" ]
          , div [ class "form-page-option" ] [ text "Area" ]
          , div [ class "form-page-option" ] [ text "Contact" ]
          , div [ class "form-page-option option-active" ] [ text "Confirmation" ]
      ]
      , div [ class "codeform-text-container" ] [
          span [ class "codeform-text" ] [ text ("Enter the confirmation code sent to " ++ model.phone) ]
          , input [ class "form-input codeform-input", placeholder "code", Html.Attributes.attribute "onfocus" "this.placeholder=''", onInput InputCode, value model.code] []
          , span [ class "codeform-text" ] [ text "." ]
      ]
      , button [ class "next-button", onClick ( submit model ) ] []
      ]
  ]



submit : Model -> Msg
submit model =
  if validateCode model.code then
    Msg.ConfirmCode
  else
    Msg.UpdateError "Looks like your code was incorrect, try entering it again!"



validateCode : String -> Bool
validateCode code =
  if (String.length code) > 0 then
    True
  else
    False
