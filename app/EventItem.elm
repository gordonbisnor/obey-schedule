module EventItem exposing (eventItem)
import Html exposing (li, h2, dl, dt, dd, text)  
import Html.Attributes exposing (class)
import ArtistList exposing (artistList
  )
eventItem event = 
  li [class "event"][
    h2[class "artist-detail-link"][artistList event.artists],
    dl [] [
      dt [] [text "Venue"],
      dd [] [text event.venue],
      dt [] [text "Time"],
      dd [] [text event.time]
    ]
  ]