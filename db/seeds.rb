# Users
User.create(first_name: "Philip", last_name: "Giuliani")
User.create(first_name: "Patrick", last_name: "Gruber")
User.create(first_name: "Victor", last_name: "ADASCALITEI")

# Locations
location_laives = Location.create(
  name: "Laives",
  serial: "04ECB67AB92980",
  latitude: 11.337291,
  longitude: 46.427114
)

location_bolzano = Location.create(
  name: "Bolzano",
  serial: "0424AE7AB92980",
  latitude: 11.354758,
  longitude: 46.498295
)

# Missions
Mission.create(
  name: "Great Mission"
  start_location: location_laives,
  end_location: location_bolzano
)
