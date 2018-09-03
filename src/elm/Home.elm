module Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html exposing (..)
import Routing exposing (..)
import Models exposing (..)
import Msg exposing (..)



view : Model -> Html Msg
view model =
  div [ class "home" ] [
    div [ class "intro-section" ] [
        div [ class "beach-section" ] [
          video [ autoplay True, loop True, Html.Attributes.attribute "muted" "", poster "https://storage.googleapis.com/baloo-media/image/lost_coast_beach_image.png" ] [
            source [ src "https://storage.googleapis.com/baloo-media/video/lost_coast_beach.mp4" ] []
          ]
        ]
        , div [ class "intro-container" ] [
            div [ class "logo-text" ] [ text "baloo" ]
            , div [ class "intro-text-container" ] [
                div [ class "intro-text" ] [ text "Weekly actions for a healthier planet" ]
                , button [ onClick (Msg.ChangeLocation signupNamePath)
                     , class "signupButton"
                     ] [ text "Sign up" ]
            ]
        ]
      ]
    , div [ class "messaging-section" ] [
        img [ class "messaging-img", src "https://storage.googleapis.com/baloo-media/image/messaging.png" ] []
        , div [ class "messaging-header" ] [ text "Simplified Sustainability" ]
    ]
    , div [ class "footer" ] [
        div [ class "footer-container" ] [
          div [ class "footer-logo" ] [ text "baloo" ]
        ]
    ]
  ]

