# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sfo = Airport.create(name: "SFO")
nyc = Airport.create(name: "NYC")

Flight.create(start: Time.zone.now, duration: 180,
              to_airport_id: sfo.id, from_airport_id: nyc.id)

Flight.create(start: 1.hour.since, duration: 80,
              to_airport_id: sfo.id, from_airport_id: nyc.id)


Flight.create(start: 3.hours.since, duration: 90,
              to_airport_id: nyc.id, from_airport_id: sfo.id)

Flight.create(start: 1.hour.ago, duration: 190,
              to_airport_id: nyc.id, from_airport_id: sfo.id)
