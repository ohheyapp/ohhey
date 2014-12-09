# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MissedConnection.create(
  location: '261 Moore St, Brooklyn, NY 11206',
  title: 'You were eating pizza',
  body: 'You had sauce on your flannel',
  user_id: 1,
  question: 'What color shirt was I wearing?',
  answer: 'Plaid'
)

MissedConnection.create(
  location: '6 Wyckoff Ave, Brooklyn, NY 11237',
  title: 'Cobra Club',
  body: 'Drunk karoke. You sang Backstreet Boys with your bros and made my heart palpitate.',
  user_id: 1,
  question: 'What shape was my mustache?',
  answer: 'Handlebar'
)

MissedConnection.create(
  location: '211 Knickerbocker Ave Brooklyn, NY 11237',
  title: 'Three Diamond Door',
  body: 'I can\'t stop dreaming about your Mike Tyson tattoo',
  user_id: 1,
  question: 'What kind of bike was I riding?',
  answer: 'fixie'
)

MissedConnection.create(
  location: '1165 Broadway, Brooklyn, NY 11221',
  title: 'Supermarket Babe',
  body: 'You were deciding which vegan chorizo to buy and we briefly made eye contact. Find me on happn cutie.',
  user_id: 1,
  question: 'What kind of fruit did I have in my basket?',
  answer: 'banana'
)

MissedConnection.create(
  location: '618 Grand St, Brooklyn, NY 11211',
  title: 'Put Put Champion',
  body: 'You you killing it at put put, but left before I could buy you a pickle back.',
  user_id: 1,
  question: 'What did I have a tattoo of?',
  answer: 'the deathly hallows'
)
