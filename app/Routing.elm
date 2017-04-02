module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (Parser, (</>), s, int, string, map, oneOf, parseHash, top)

type alias DayId =
    Int

type Route
    = HomeRoute
    | DayRoute DayId
    | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ 
          map HomeRoute top
        , map DayRoute (s "days" </> int)
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRoute
