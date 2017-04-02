module InitialModel exposing (initialModel)

import Content exposing (content)
import Artists exposing (artists)
import GetEvents exposing (getEvents)
import Artist exposing (Artist)

initialModel currentRoute =
  let model = 
    {
      data = content,
      artists = artists, 
      events = (getEvents content), 
      selectedDayName = "Thursday",
      route = currentRoute,
      artistDetail =  Nothing
    }
  in
    analyze model currentRoute

analyze model route =
  case route of
    _ ->
      { model | route = route }
