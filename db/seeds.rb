# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end

users = User.all

40.times do
  Alibi.create(
    title: Faker::Games::Pokemon.move,
    content: Faker::TvShows::Simpsons.quote,
    status: %w[family date journey speak cinema].sample,
    category: %w[valide archived].sample,
    date: Faker::Date.between(from: '2023-11-24', to: '2026-09-25'),
    image: Faker::Avatar.image,
    price: rand(1..10000),
    user_id: users[rand(1..20)]
  )
end
puts 'User create!'
