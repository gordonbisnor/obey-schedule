module DayItem exposing (dayItem)
import Html exposing (li, a, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Message exposing (..)

dayItem model day = 
  li [][
    if model.selectedDayName == day.name then
      a [class "active", href "#", onClick (ChooseDay day.id)] [text day.name]
    else
      a [href "#", onClick (ChooseDay day.id)] [text day.name]
  ]
