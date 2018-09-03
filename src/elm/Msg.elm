module Msg exposing (..)

import Navigation exposing (Location)
import Models exposing (..)
import Http



type Msg
  = ChangeLocation String
  | OnLocationChange Location
  | InputFirstname String
  | InputLastname String
  | InputZipcode String
  | InputPhone String
  | CreateTemporaryUser
  | TempUserCreated ( Result Http.Error ApiResponse )
  | ConfirmCode
  | CodeConfirmed ( Result Http.Error ApiResponse )
  | InputCode String
  | UpdateError String
