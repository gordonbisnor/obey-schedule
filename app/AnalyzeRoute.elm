module AnalyzeRoute exposing (analyzeRoute)
import Routing exposing (parseLocation)

analyzeRoute model route =
  case route of
    _ ->
      ( { model | route = route }, Cmd.none )
