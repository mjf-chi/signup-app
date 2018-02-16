module Update exposing (..)

import Msg exposing (Msg)
import Models exposing (..)
import Routing exposing (..)
import Commands exposing (..)
import Navigation
import Debug exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Msg.ChangeLocation path ->
      ( { model | changes = model.changes + 1 }, Navigation.newUrl path )

    Msg.OnLocationChange location ->
      ( { model | error = "", route = parseLocation(location) }, Cmd.none )

    Msg.InputFirstname name ->
      ( { model | firstname = name }, Cmd.none )

    Msg.InputLastname name ->
      ( { model | lastname = name }, Cmd.none )

    Msg.InputPhone phone ->
      ( { model | phone = phone }, Cmd.none )

    Msg.CreateTemporaryUser ->
      ( model, createTempUser model )

    Msg.TempUserCreated (Ok res) ->
       update (Msg.ChangeLocation signupCodePath) { model | httpResponse = toString(res) }

    Msg.TempUserCreated (Err err) ->
       update (Msg.ChangeLocation signupCodePath) { model | error = toString(err) }

    Msg.ConfirmCode ->
      ( model, confirmCode model )

    Msg.CodeConfirmed (Ok res) ->
      update (Msg.ChangeLocation thankyouPath) model

    Msg.CodeConfirmed (Err err) ->
      update (Msg.ChangeLocation thankyouPath) model

    Msg.InputCode code ->
      ( { model | code = code }, Cmd.none )

    Msg.UpdateError error ->
      ( { model | error = error }, Cmd.none )
