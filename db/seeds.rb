# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Housing.destroy_all
User.destroy_all

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  Housing.create(
    title: Faker::BossaNova.artist,
    price: Faker::Number.number(digits: 6),
    description: Faker::Hacker.say_something_smart,
    address: Faker::Address.street_address,
    user: User.all.sample
  )
end