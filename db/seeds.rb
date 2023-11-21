puts 'Creating 20 fake users...'
20.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
puts 'Users created!'

users = User.all

puts 'Creating 40 fake alibis...'
40.times do
  Alibi.create!(
    title: Faker::Games::Pokemon.move,
    content: Faker::TvShows::Simpsons.quote,
    status: %i[available archived].sample,
    category: %w[family date journey speak cinema].sample,
    date: Faker::Date.between(from: '2023-11-24', to: '2026-09-25'),
    image: Faker::Avatar.image,
    price: rand(1..10000),
    user: users.sample
  )
end
puts 'Alibis created!'
