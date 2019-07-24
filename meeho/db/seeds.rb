# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(
    name: 'RubySchool', 
    start_date: DateTime.now,
    end_date: 6.weeks.from_now, 
    description: 'La mejor manera de aprender Ruby on Rails')

User.create(
    email: 'admin@mehoo.com', 
    first_name: 'César', 
    last_name: 'Sáenz',
    date_of_birth: DateTime.new(1997, 11, 26))
