module ArtistList exposing (artistList)

import Html exposing (ul)
import Html.Attributes exposing (class)
import ArtistItem exposing (artistItem)

artistList artists =
  let 
    listItems = List.map (artistItem) artists
  in
    ul [class "list-unstyled"] listItems
