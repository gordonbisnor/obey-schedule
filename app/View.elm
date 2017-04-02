module View exposing (view)

import Html exposing (div, text, span, h2, img)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import EventList exposing (eventList)
import DayName exposing (dayName)
import DayList exposing (dayList)
import PageHeader exposing (pageHeader)
import Artist exposing (Artist)
import ArtistDetail exposing (artistDetail)

view model =
  case model.artistDetail of
    Just x ->
      div[][showArtistDetail model.artistDetail]
    Nothing ->
      div [class "container"][ 
        pageHeader, 
        dayList model model.data,
        dayName model,
        eventList model.events      
      ]

showArtistDetail detail =
  case detail of
    Just x ->
      artistDetail x
    Nothing ->
      span[][text ""]
