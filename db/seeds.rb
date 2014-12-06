# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MissedConnection.create(
  latitude: 40.705077,
  longitude: -73.933592,
  title: 'You were eating pizza',
  body: 'You had sauce on your flannel',
  user_id: 1
)

MissedConnection.create(
  latitude: 40.706709,
  longitude: -73.923516,
  title: 'Cobra Club',
  body: 'Drunk karoke',
  user_id: 1
)

MissedConnection.create(
  latitude: 40.703515,
  longitude: -73.926153,
  title: 'Three Diamond Door',
  body: 'I can\'t stop dreaming about your Mike Tyson tattoo',
  user_id: 1
)
