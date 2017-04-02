-- making it change route for day
-- adding artist photos and bios –– drops down below name? modal? making those use routes  
module Obey exposing (main)

import Message exposing (..)
import Navigation exposing (program)
import View exposing (view)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import Init exposing (init)

main =
  Navigation.program OnLocationChange
  { 
    init = init,
    view = view, 
    update = update,
    subscriptions = subscriptions
  }
