module GetDayName exposing (getDayName)

getDayName model =
  case (List.head model) of
    Just x -> x.name
    Nothing -> ""
