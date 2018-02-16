module Commands exposing (..)

import Models exposing (..)
import Msg exposing (..)
import Http
import Json.Decode as Decode
import Json.Encode as Encode



createTempUser : Model -> Cmd Msg
createTempUser model =
  let
    tempUserBody =
      [ ( "firstname", Encode.string model.firstname )
      , ( "lastname", Encode.string model.lastname )
      , ( "phone", Encode.string model.phone )
      ]
        |> Encode.object
        |> Http.jsonBody

    url =
      balooAPIUrl ++ "/addTempUser"

    contentType = Http.header "Content-type" "text/plain"

    post =
      Http.request
        { method = "POST"
        , headers =  [contentType]
        , url = url
        , body = tempUserBody
        , expect = Http.expectJson decodeApiResponse
        , timeout = Nothing
        , withCredentials = False
        }

  in
    Http.send Msg.TempUserCreated post



confirmCode : Model -> Cmd Msg
confirmCode model =
  let
    codeConfirmationBody =
      [ ( "phone", Encode.string model.phone )
      , ( "code", Encode.string model.code )
      ]
        |> Encode.object
        |> Http.jsonBody

    url =
      balooAPIUrl ++ "/confirmTempCode"

    contentType = Http.header "Content-type" "text/plain"

    post =
      Http.request
        { method = "POST"
        , headers = [contentType]
        , url = url
        , body = codeConfirmationBody
        , expect = Http.expectJson decodeApiResponse
        , timeout = Nothing
        , withCredentials = False
        }
  in
    Http.send Msg.CodeConfirmed post



decodeApiResponse : Decode.Decoder ApiResponse
decodeApiResponse =
  Decode.map4 ApiResponse
    (Decode.at ["status"] Decode.int)
    (Decode.at ["message"] Decode.string)
    (Decode.at ["created"] Decode.int)
    (Decode.at ["error"] Decode.string)



balooAPIUrl : String
balooAPIUrl = "http://localhost:8081"
