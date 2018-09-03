module NameForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Routing exposing (..)
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
          div [ class "form-page-option option-active" ] [ text "Name" ]
          , div [ class "form-page-option" ] [ text "Area" ]
          , div [ class "form-page-option" ] [ text "Contact" ]
          , div [ class "form-page-option" ] [ text "Confirmation" ]
      ]
      , div [ class "nameform-text-container" ] [
          span [ class "nameform-text" ] [ text "My name is " ]
          , input [ class "form-input", placeholder "first", Html.Attributes.attribute "onfocus" "this.placeholder=''", onInput InputFirstname, value model.firstname] []
          , input [ class "form-input", placeholder "last", Html.Attributes.attribute "onfocus" "this.placeholder=''", onInput InputLastname, value model.lastname] []
          , span [ class "nameform-text" ] [ text "." ]
      ]
      , button [ class "next-button", onClick ( submit model ) ] []
      ]
  ]



--
-- Validate the first and last name values
-- Change location to enter phone number
-- 
--
submit : Model -> Msg
submit model =
  if validateNames model.firstname model.lastname then
    Msg.ChangeLocation signupZipcodePath
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
