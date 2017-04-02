module ArtistDetail exposing (artistDetail)

import Html exposing (div, img, h2, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Message exposing (..)

artistDetail artist =
  div[class "artist-detail"][
    img[class "artist-photo", src ("images/" ++ artist.photo)][],
    h2[][text artist.name],
    div[class "content"][
      text artist.bio
    ],
    div[class "close-artist-detail", onClick HideArtistDetail][
      img[src "images/glyphicons-217-circle-arrow-left.svg"][]
    ]
    
  ]