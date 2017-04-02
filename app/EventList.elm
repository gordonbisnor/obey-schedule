module EventList exposing (eventList)

import Html exposing (ul)
import Html.Attributes exposing (class)
import EventItem exposing (eventItem)

eventList events =
  let 
    listItems = List.map (eventItem) events
  in
    ul [class "list-unstyled events" ] listItems
