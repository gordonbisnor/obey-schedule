module ArtistItem exposing (artistItem)

import Html exposing (li)
import Html.Attributes exposing (class)
import ArtistName exposing (artistName)

artistItem artist =
  li [class "artist-item"][artistName artist]