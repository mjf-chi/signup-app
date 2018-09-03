module ZipForm exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Routing exposing (..)
import Models exposing (..)
import Msg exposing (..)


view: Model -> Html Msg
view model =
  div [ class "form-page" ] [
    div [ class "form-page-container" ]
      [ div [ class "logo-container" ] [
          span [ class "form-page-logo" ] [ text "baloo" ]
          , span [ class "form-page-sublogo" ] [ text "sign up" ]
      ]
      , div [ class "form-page-nav" ] [
          div [ class "form-page-option" ] [ text "Name" ]
          , div [ class "form-page-option option-active" ] [ text "Area" ]
          , div [ class "form-page-option" ] [ text "Contact" ]
          , div [ class "form-page-option" ] [ text "Confirmation" ]
      ]
      , div [ class "zipform-text-container" ] [
          span [ class "zipform-text" ] [ text "I'd like to focus on sustainable issues affecting the " ]
          , input [ class "form-input", placeholder "ZIP code", Html.Attributes.attribute "onfocus" "this.placeholder=''", onInput InputZipcode, value model.zipcode] []
          , span [ class "zipform-text" ] [ text "area." ]
      ]
      , button [ class "next-button", onClick ( submit model ) ] []
      ]
  ]


submit : Model -> Msg
submit model =
  if validateZipcode model.zipcode then
    Msg.ChangeLocation signupPhonePath
  else
    Msg.UpdateError "Please add a valid five digit zipcode"


validateZipcode : String -> Bool
validateZipcode zipcode =
  if (String.length zipcode) == 5 then
    True
  else
    False
