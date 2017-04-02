module DayName exposing (dayName)

import Html exposing (h1, text)
import Html.Attributes exposing (class)

dayName model =
  h1 [class "day-name"] [text model.selectedDayName]
