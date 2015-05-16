# Users
User.create(first_name: "Philip", last_name: "Giuliani")
User.create(first_name: "Patrick", last_name: "Gruber")
User.create(first_name: "Victor", last_name: "ADASCALITEI")

# Mission 1
location_barbian = Location.create(
  name: "Barbian",
  serial: "04ECB67AB92980",
  latitude: 1282409.8200758,
  longitude: 5877712.8871171
)

location_rittner_horn = Location.create(
  name: "Rittner Horn",
  serial: "0424AE7AB92980",
  latitude: 1275874.4541574,
  longitude: 5879394.5017394
)

Mission.create(
  name: "Barbian to Rittner Horn",
  start_location: location_barbian,
  end_location: location_rittner_horn
)

# Mission 2
location_merano = Location.create(
  name: "Merano",
  serial: "0452AC7AB92980",
  latitude: 1243159.4311546,
  longitude: 5888528.7015164
)

location_meraner_hütte = Location.create(
  name: "Meraner Hütte",
  serial: "040CB07AB92980",
  latitude: 1256000.8519066,
  longitude: 5890516.0642518
)

Mission.create(
  name: "Merano to Meraner Hütte",
  start_location: location_merano,
  end_location: location_meraner_hütte
)

# Mission 3
location_bressanone = Location.create(
  name: "Bressanone",
  serial: "04FCAC7AB92980",
  latitude: 1296397.7990413,
  longitude: 5895216.9638054
)

location_radl_see_huette = Location.create(
  name: "Radlseehütte",
  serial: "04BEAF7AB92980",
  latitude: 1289098.0684186,
  longitude: 5894509.9157153
)

Mission.create(
  name: "Bressanone to Radlseehütte",
  start_location: location_bressanone,
  end_location: location_radl_see_huette
)
