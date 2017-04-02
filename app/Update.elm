module Update exposing (update)

import AnalyzeRoute exposing (analyzeRoute)
import Routing exposing (parseLocation)
import Message exposing (..)
import GetDayName exposing (getDayName)
import GetEvents exposing (getEvents)
import Content exposing (content)
import Artists exposing (artists)

update msg model =
  case msg of 
    NoOp -> 
      (model, Cmd.none)
    ChooseDay id ->
      let selectedDays =
        List.filter (\e -> e.id == id ) content
      in
        ({ model | events = (getEvents selectedDays), selectedDayName = (getDayName selectedDays) }, Cmd.none)
    OnLocationChange location ->
      let
        newRoute =
          parseLocation location
      in
        analyzeRoute model newRoute
    ShowArtistDetail id ->
      let artist =
        List.filter (\e -> e.id == id ) artists |> List.head
      in
        ({ model | artistDetail = artist}, Cmd.none)
    HideArtistDetail ->
      ({ model | artistDetail = Nothing}, Cmd.none)
