# Users
User.create(
  first_name: "Philip",
  last_name: "Giuliani",
  email: "philip@hiking.eu",
  password: "hiking",
  picture: File.open(Rails.root.join("db/seeds-data/philip-picture.jpg"))
)

User.create(
  first_name: "Patrick",
  last_name: "Gruber",
  email: "patrick@hiking.eu",
  password: "hiking"
)

User.create(
  first_name: "Victor",
  last_name: "ADASCALITEI",
  email: "victor@hiking.eu",
  password: "hiking"
)

# Mission 1
location_barbian = Location.create(
  name: "Barbian",
  serial: "04ECB67AB92980",
  latitude: 46.60495910142019,
  longitude: 11.520532521517373
)

location_rittner_horn = Location.create(
  name: "Rittner Horn",
  serial: "0424AE7AB92980",
  latitude: 46.61445838879959,
  longitude: 11.461451232775296
)

mission_barbian = Mission.create(
  name: "Barbian to Rittner Horn",
  start_location: location_barbian,
  end_location: location_rittner_horn,
  distance: 9590
)
mission_barbian.import_route("rittner_horn.gpx")

# Mission 2
location_merano = Location.create(
  name: "Merano",
  serial: "0452AC7AB92980",
  latitude: 46.671818687294824,
  longitude: 11.161365199692332
)

location_meraner_hütte = Location.create(
  name: "Meraner Hütte",
  serial: "040CB07AB92980",
  latitude: 46.72635291318424,
  longitude: 11.119595738149268
)

mission_merano = Mission.create(
  name: "Merano to Meraner Hütte",
  start_location: location_merano,
  end_location: location_meraner_hütte,
  distance: 8490
)
mission_merano.import_route("boecker_huette.gpx")

# Mission 3
location_bressanone = Location.create(
  name: "Bressanone",
  serial: "04FCAC7AB92980",
  latitude: 46.71146641952482,
  longitude: 11.648182984773465
)

location_radl_see_huette = Location.create(
  name: "Klausnerhütte",
  serial: "04BEAF7AB92980",
  latitude: 46.6988922764636,
  longitude: 11.521776250006832
)

mission_bressanone = Mission.create(
  name: "Bressanone to Klausnerhütte",
  start_location: location_bressanone,
  end_location: location_radl_see_huette,
  distance: 15720
)
mission_bressanone.import_route("klausner_huette.gpx")
