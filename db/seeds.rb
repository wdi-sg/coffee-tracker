# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cinnamon = Roast.create(name: 'Cinnamon')
light = Roast.create(name: 'Light')
medium = Roast.create(name: 'City/Medium')
city = Roast.create(name: 'Full City')
dark = Roast.create(name: 'Dark')
french = Roast.create(name: 'French')
italian = Roast.create(name: 'Italian')

origin = Origin.create(location: 'Bengaluru, India', phone: '+91 9123456789')

kopi = Kopi.create(name: 'Bru Coffee', roast: medium, origin: origin)