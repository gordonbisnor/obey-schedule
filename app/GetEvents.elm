module GetEvents exposing (getEvents)

getEvents model =
  case (List.head model) of
    Just x -> x.events
    Nothing -> []
