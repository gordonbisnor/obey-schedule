module ArtistName exposing (artistName)

import Html exposing (div, a, text)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Message exposing (..)

artistName artist = 
  div [onClick (ShowArtistDetail artist.id)][text artist.name] 

artistDetails artist =
  a [href artist.link]

