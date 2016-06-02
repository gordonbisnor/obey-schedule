import Html.App as Html
import Html exposing (div, span, h1, text, footer, ul, li, a, strong, h2, dl, dt, dd, img)
import Html.Attributes exposing (class, title, href, src)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
    { model = initialModel, view = view, update = update }

-- UPDATE

type Action 
  = NoOp 
  | ChooseDay Int

update action model =
  case action of 
    NoOp -> 
      model
    ChooseDay id ->
      let selectedDays =
        List.filter (\e -> e.id == id ) content
      in
        { model | events = (getEvents selectedDays), selectedDayName = (getDayName selectedDays) }

-- VIEW

view model =
  div [class "container"]
    [ 
      pageHeader, 
      dayList model model.data,
      dayName model,
      eventList model.events
    ]

getDayName model =
  case (List.head model) of
    Just x -> x.name
    Nothing -> ""

getEvents model =
  case (List.head model) of
    Just x -> x.events
    Nothing -> []

pageHeader =
  div [class "page-header"] [
    img [src "http://www.obeyconvention.com/wp-content/uploads/2016/02/OBEY-2016-Logo-web.png"][]
  ]

dayName model =
  h2 [class "day-name"] [text model.selectedDayName]

dayList model days =
  let 
    listItems = List.map (dayItem model) days 
  in
    ul [class "list-unstyled days" ] listItems

dayItem model day = 
  li [][
    if model.selectedDayName == day.name then
      a [class "active", href "#", onClick (ChooseDay day.id)] [text day.name]
    else
      a [href "#", onClick (ChooseDay day.id)] [text day.name]
  ]

eventList events =
  let 
    listItems = List.map (eventItem) events
  in
    ul [class "list-unstyled events" ] listItems
  
eventItem event = 
  li [class "event"][
    h2 [] [artistList event.artists],
    dl [] [
      dt [] [text "Venue"],
      dd [] [text event.venue],
      dt [] [text "Time"],
      dd [] [text event.time]
    ]
  ]

artistList artists =
  let 
    listItems = List.map (artistItem) artists
  in
    ul [class "list-unstyled"] listItems

artistItem artist =
  li [][artistName artist]

artistName artist = 
  if artist.link == ""  then
    span [][text artist.name]
  else
    span [][a [href artist.link] [text artist.name] ]

-- MODEL

initialModel =
  {data = content, events = (getEvents content), selectedDayName = "Thursday" }

content = [{
    id = 1,
    name = "Thursday",
    events = [
      {artists = [{name = "Kaie Kellough", link = "http://www.obeyconvention.com/artists/kaie-kellough/"}], venue = "Halifax Central Library", time = "6:30-7:30pm"},
      {artists = [{name = "Nadja", link = "http://www.obeyconvention.com/artists/nadja/"}, {name = "Sounds of the Mountain", link = "http://www.obeyconvention.com/artists/sound-of-the-mountain/"}, {name = "Cloaked Figure", link = "http://www.obeyconvention.com/artists/cloaked-figure/"}], venue = "Fort Massey", time = "7:30-10pm"},
      {artists = [{name = "Dalty Rose C.-L" , link = ""}, {name = "Anni Aruajo Spadafora", link = ""}, {name = "Erika Ellsworth", link = ""}], venue = "Khyber", time = "10pm-2am"},
      {artists = [{name = "Belave", link = "http://www.obeyconvention.com/artists/belave/"}, {name = "Eddy", link = "http://www.obeyconvention.com/artists/eddy/"}], venue = "Art Bar", time = "10PM-2AM"}
    ]
  },
  {
    id = 2,
    name = "Friday",
    events = [
      {artists = [{name = "Lungbutter", link = "http://www.obeyconvention.com/artists/lungbutter/"}, {name = "Alienation", link = "http://www.obeyconvention.com/artists/alienation/"}], venue = "Memorial North Library", time = "6-8pm"},
      {artists = [{name = "Ridwan rau rau", link = ""}, {name = "Beck Gilmer-Osborne", link = ""}, {name = "Baby Morocco", link = ""}], venue = "Khyber", time = "6-8pm"},
      {artists = [{name = "Zs", link = "http://www.obeyconvention.com/artists/zs/"},{name = "Shining Wizard", link = "http://www.obeyconvention.com/artists/shining-wizard/"}], venue = "Deep Water Church", time = "8-10:30pm"},
      {artists = [{name = "Marie Davidson", link = "http://www.obeyconvention.com/artists/marie-davidson/"}, {name = "Carmen", link = "http://www.obeyconvention.com/artists/carmen/"}, {name = "HHH", link = "http://www.obeyconvention.com/artists/hhh/"}, {name = "Feels", link = "http://www.obeyconvention.com/artists/feels/"}, {name = "NoiSeCAD", link = "http://www.obeyconvention.com/artists/noisecad/"}], venue = "Menz Bar", time = "10:30pm-2:30am"}
    ]
  },
  {
    id = 3,
    name = "Saturday",
    events = [
      {artists = [{link = "", name = "Gonzago & Friends"}], venue = "Khyber", time = "12-2pm"},
      {artists = [{link = "", name = "Piper Curtis"}], venue = "Art Bar", time = "12-2pm"},
      {artists = [{link = "", name = "Steven Baur"}, {name = "Rajee Paña Jeji Shergill", link = ""}], venue = "AGNS", time = "12:30-2pm"},
      {artists = [{link = "", name = "Robert Drisdelle"}], venue = "various locations", time = "2pm-2am"},
      {artists = [{link = "", name = "Danielle Jakubiak"}, {name = "Dave Ewenson", link = ""}], venue = "AGNS", time = "2-3:30pm"},
      {artists = [{link = "http://www.obeyconvention.com/artists/lindsay-dobbin/", name = "Lindsay Dobbin"}], venue = "Outside AGNS", time = "3:40-4:40pm"},
      {artists = [{link = "", name = "Dave Clark"}], venue = "Art Bar", time = "5-6pm"},
      {artists = [{link = "http://www.obeyconvention.com/artists/joshua-abrams-natural-information-society/", name = "Joshua Abrams"}, {name = "xxvi", link = "http://www.obeyconvention.com/artists/xxvii/"}], venue = "Deep Water Church", time = "7-9:30pm"},
      {artists = [{name = "Mykki Blanco", link = "http://www.obeyconvention.com/artists/mykki-blanco/"}, {name = "Rabit", link = "http://www.obeyconvention.com/artists/rabit/"}, {name = "DJ Kaz_Kandy", link = "http://www.obeyconvention.com/artists/dj-kaz_kandy/"}, {name = "DJ Fadzwa", link = "http://www.obeyconvention.com/artists/dj-fadzwa-2/"}], venue = "Marquee" , time = "9:30pm-12:30am"},
      {artists = [{name = "New Fries", link = "http://www.obeyconvention.com/artists/new-fries/"}, {name = "Zones", link = "http://www.obeyconvention.com/artists/zones/"}, {name = "Wayne World", link = "http://www.obeyconvention.com/artists/wayne-world/"}, {name = "DJ I-Rad", link = "http://www.obeyconvention.com/artists/dj-i-rad/"}, {name = "Aaron Webster", link = "http://www.obeyconvention.com/artists/aaron-webster/"}], venue = "Menz Bar", time = "10:30pm-2:20am"}
    ]
  },   
  {
    id = 4,
    name = "Sunday",
    events = [
      {artists =  [{name = "Old and Weird", link = "http://www.obeyconvention.com/artists/old-and-weird/"}, {name = "Brave Radar", link = "http://www.obeyconvention.com/artists/brave-radar/"}, {name = "Century Egg", link = "http://www.obeyconvention.com/artists/century-egg/"}], venue = "7 Bays Bouldering", time = "12-3pm"},
      {artists =  [{name = "Life of a Craphead", link = ""}], venue = "Art Bar", time = "3-5pm"},
      {artists =  [{name = "William Robinson", link = "http://www.obeyconvention.com/artists/william-robinson/"}], venue = "Fort Massey", time = "5:30-6:30pm"},
      {artists =  [{name = "Sarah Davachi", link = "http://www.obeyconvention.com/artists/sarah-davachi/"}, {name = "Lindsay Dobbin", link = ""}], venue = "Fort Massey", time = "7-9pm"}
    ]
  }]  
