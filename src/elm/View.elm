module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Routing exposing (..)
import Msg exposing (..)
import Models exposing (..)

import Home
import NameForm
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
      div [] [ Home.view model
             , div [] [ text (toString(model)) ]
             ]

    Models.EnterName ->
      div [] [ NameForm.view model
             , div [] [ text model.error ]
             , br [] []
             , div [] [ text (toString(model)) ]
             ]

    Models.EnterPhone ->
      div [] [ PhoneForm.view model
             , div [] [ text model.error ]
             , br [] []
             , div [] [ text (toString(model)) ]
             ]

    Models.EnterCode ->
      div [] [ CodeForm.view model
             , div [] [ text model.error ]
             , br [] []
             , div [] [ text (toString(model)) ]
             ]

    Models.ThankYou ->
      div []
        [ div [] [ text "Thank you for signing up!" ]
        , a [ href homePath
            , onLinkClick ( Msg.ChangeLocation homePath )
            ] [ text "Home" ]
        ]

    Models.NotFoundRoute ->
      div []
        [ div [] [ text "Page not found" ] ]

