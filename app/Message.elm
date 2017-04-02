module Message exposing (..)

import Navigation exposing (Location)

type Msg =
  NoOp 
  | OnLocationChange Location
  | ChooseDay Int
  | ShowArtistDetail Int
  | HideArtistDetail

