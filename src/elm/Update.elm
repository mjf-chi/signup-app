module Update exposing (..)

import Msg exposing (Msg)
import Models exposing (..)
import Routing exposing (..)
import Commands exposing (..)
import Navigation


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

    Msg.InputZipcode zip ->
      ( { model | zipcode = zip }, Cmd.none )

    Msg.InputPhone phone ->
      ( { model | phone = phone }, Cmd.none )

    Msg.CreateTemporaryUser ->
      ( { model | loading = True }, createTempUser model )

    Msg.TempUserCreated (Ok res) ->
       update (Msg.ChangeLocation signupCodePath) { model |
                                                      httpResponse = toString(res)
                                                      , loading = False }

    Msg.TempUserCreated (Err err) ->
       ( { model |
             error = "Invalid phone number"
             , loading = False }, Cmd.none )

    Msg.ConfirmCode ->
      ( { model | loading = True }, confirmCode model )

    Msg.CodeConfirmed (Ok res) ->
      update (Msg.ChangeLocation thankyouPath) { model | loading = False }

    Msg.CodeConfirmed (Err err) ->
      ( { model |
            error = "There was an error with the code you entered, try again!"
            , loading = False }, Cmd.none )

    Msg.InputCode code ->
      ( { model | code = code }, Cmd.none )

    Msg.UpdateError error ->
      ( { model | error = error }, Cmd.none )
