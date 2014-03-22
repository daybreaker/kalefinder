# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
)
u.skip_confirmation!
u.save!

Package.create!(
  name: "voodoo",
  description: "derp voodoo and stuff"
)

Package.create!(
  name: "drinker",
  description: "i like to drink"
)

Package.create!(
  name: "hipster",
  description: "i like coffee and punk"
)

Place.create!(
  short_name: 'Columns',
  lat: 29.931170,
  long: -90.086088,
  address: 'i100 Derp Ln 70123',
  package_1: 0.5,
  package_2: 0.6,
  package_3: 0.15
)

Place.create!(
  short_name: 'BJs',
  lat: 29.962554,
  long: -90.038195,
  address: '100 Derp Ln 70123',
  package_1: 0.3,
  package_2: 0.4,
  package_3: 0.92
)

Place.create!(
  short_name: 'Lafitte\'s blacksmith',
  lat: 29.961364,
  long: -90.061884,
  address: '100 Derp Ln 70123',
  package_1: 0.93,
  package_2: 0.6,
  package_3: 0.2
)

