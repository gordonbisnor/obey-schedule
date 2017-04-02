module Init exposing (init)
import Routing exposing (..)
import InitialModel exposing (initialModel)

init location = 
 let
    currentRoute = Routing.parseLocation location
  in
    (initialModel currentRoute, Cmd.none)