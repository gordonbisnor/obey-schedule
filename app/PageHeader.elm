module PageHeader exposing (pageHeader)

import Html exposing (div, img)
import Html.Attributes exposing (class, src)

pageHeader =
  div [class "page-header"] [
    img [src "http://www.obeyconvention.com/wp-content/uploads/2016/02/OBEY-2016-Logo-web.png"][]
  ]