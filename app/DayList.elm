module DayList exposing (dayList)

import Html exposing (ul)
import Html.Attributes exposing (class)
import DayItem exposing (dayItem)

dayList model days =
  let 
    listItems = List.map (dayItem model) days 
  in
    ul [class "list-unstyled days" ] listItems
