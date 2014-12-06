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
  question: 'What pattern was on my shirt?'
  text: 'Flannel Plaid'
  )

MissedConnection.create(
  latitude: 40.706709,
  longitude: -73.923516,
  title: 'Cobra Club',
  body: 'Drunk karoke. You sang Backstreet Boys with your bros and made my heart palpitate.',
  user_id: 1
  question: 'What shape was my mustache?'
  answer: 'Handlebar'
)


MissedConnection.create(
  latitude: 40.703515,
  longitude: -73.926153,
  title: 'Three Diamond Door',
  body: 'I can\'t stop dreaming about your Mike Tyson tattoo',
  user_id: 1
  question: 'What kind of bike was I riding?'
  answer: 'fixie'
)

MissedConnection.create(
  latitude: 40.703386,
  longitude: -73.925414,
  title: 'Supermarket Babe',
  body: 'You were deciding which vegan chorizo to buy and we briefly made eye contact. Find me on happn cutie.',
  user_id: 1
  question: 'What kind of fruit did I have in my basket?'
  answer: 'banana'
)

MissedConnection.create(
  latitude: 40.711380,
  longitude: -73.947451,
  title: 'Put Put Champion',
  body: 'You you killing it at put put, but left before I could buy you a pickle back.',
  user_id: 1,
  question: 'What did I have a tattoo of?',
  answer: 'the deathly hallows'
)
