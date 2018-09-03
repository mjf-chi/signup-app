module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Routing exposing (..)
import Msg exposing (..)
import Models exposing (..)

import Home
import NameForm
import ZipForm
import PhoneForm
import CodeForm



view : Model -> Html Msg
view model =
  div []
    [ page model ]



page : Model -> Html Msg
page model =
  case model.route of
    Models.Home ->
      div [] [ Home.view model ]

    Models.EnterName ->
      div [] [ NameForm.view model
             , div [] [ text model.error ] ]

    Models.EnterZip ->
      div [] [ ZipForm.view model
             , div [] [ text model.error ] ]

    Models.EnterPhone ->
      div [] [ PhoneForm.view model
             , div [] [ text model.error ]
             , checkLoading model.loading
             ]

    Models.EnterCode ->
      div [] [ CodeForm.view model
             , div [] [ text model.error ]
             , checkLoading model.loading
             ]

    Models.ThankYou ->
      div [ class "form-page" ] [
        div [ class "form-page-container" ] [
          div [ class "logo-container" ] [
              span [ class "form-page-logo" ] [ text "baloo" ]
          ]
          , div [ class "form-complete-container" ] [
              span [ class "form-complete-text" ] [ text "Thanks you! You should receive your first action shortly!" ]
          ]
          , a [ class "form-complete", href homePath, onLinkClick ( Msg.ChangeLocation homePath ) ] [ text "done" ]
        ]
      ]

    Models.NotFoundRoute ->
      div []
        [ div [] [ text "Page not found" ] ]



checkLoading : Bool -> Html msg
checkLoading bool =
  if bool then
    div [ class "loading-overlay" ] [
      div [ class "loading-element" ] [ text "loading" ]
    ]
  else
    div [] []
