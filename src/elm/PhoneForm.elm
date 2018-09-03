module PhoneForm exposing (..)

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
          , div [ class "form-page-option option-active" ] [ text "Contact" ]
          , div [ class "form-page-option" ] [ text "Confirmation" ]
      ]
      , div [ class "phoneform-text-container" ] [
          span [ class "phoneform-text" ] [ text "Baloo can send me weekly action texts at" ]
          , input [ class "form-input phone-input", placeholder "phone number", Html.Attributes.attribute "onfocus" "this.placeholder=''", onInput InputPhone, value model.phone] []
          , span [ class "phoneform-text" ] [ text "." ]
          , div [ class "phoneform-subtext" ] [ text "Baloo is free but standard messaging and data rates may apply through your provider." ]
      ]
      , button [ class "next-button", onClick ( submit model ) ] []
      ]
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
