# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RegUser.destroy_all

harry = RegUser.create(first_name: "Harry", last_name: "Potter", email: "h@h.com", school: "Hogwarts", suburb: "Hogsmeade", active_sub: true, contact_num: "111")