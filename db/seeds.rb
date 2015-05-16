# Users
User.create(first_name: "Philip", last_name: "Giuliani")
User.create(first_name: "Patrick", last_name: "Gruber")
User.create(first_name: "Victor", last_name: "ADASCALITEI")

# Mission 1
location_laives = Location.create(
  name: "Laives",
  serial: "04ECB67AB92980",
  latitude: 46.427114,
  longitude: 11.337291
)

location_bolzano = Location.create(
  name: "Bolzano",
  serial: "0424AE7AB92980",
  latitude: 46.498295,
  longitude: 11.354758
)

Mission.create(
  name: "Bolzano to Laives",
  start_location: location_laives,
  end_location: location_bolzano
)
