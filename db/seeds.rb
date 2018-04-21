# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.new(
  name: "Administrator",
  email: "admin@test.com",
  password: "123123",
  introduction: "introduction",#FFaker::Lorem::sentence(3),
  avatar: "file",
  role: "Admin"
)

admin.save!

admin = User.new(
  name: "Admin",
  email: "admin@example.com",
  password: "12345678",
  introduction: "introduction",#FFaker::Lorem::sentence(3),
  avatar: "file",
  role: "Admin"
)

admin.save!

puts "admin account created!"
