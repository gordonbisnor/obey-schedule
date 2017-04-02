module Artists exposing (artists)
import Artist exposing (Artist)

artists : List Artist
artists = 
  let 
    bio = "Nunc auctor bibendum eros. Maecenas porta accumsan mauris. Etiam enim enim, elementum sed, bibendum quis, rhoncus non, metus. Fusce neque dolor, adipiscing sed, consectetuer et, lacinia sit amet, quam. Suspendisse wisi quam, consectetuer in, blandit sed, suscipit eu, eros. Etiam ligula enim, tempor ut, blandit nec, mollis eu, lectus. Nam cursus. Vivamus iaculis. Aenean risus purus, pharetra in, blandit quis, gravida a, turpis. Donec nisl. Aenean eget mi. Fusce mattis est id diam. Phasellus faucibus interdum sapien. Duis quis nunc. Sed enim."

    photo = "bird.jpg"
  in

  [{
    id = 1,
    name = "Kaie Kellough",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 2,
    name = "Nadja",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 3,
    name = "Sounds of the Mountain",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 4,
    name = "Cloaked Figure",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 5,
    name = "Lungbutter",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 6,
    name = "Alientation",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },  
  {
    id = 7,
    name = "Ridwan",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 8,
    name = "Beck",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  },
  {
    id = 9,
    name = "Baby",
    link = "http://www.obeyconvention.com/artists/kaie-kellough/",
    bio = bio,
    photo = photo
  }]

