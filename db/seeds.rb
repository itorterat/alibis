require "open-uri"

puts 'Creating 2 users'
u = User.new(
  first_name: "John",
  last_name: "Smith",
  email: "john@smith.com",
  password: "password"
)
u.photo.attach(io: URI.open(Faker::Avatar.image), filename: 'photo.jpg', content_type: 'image/jpeg')
u.save!

u = User.new(
  first_name: "Jane",
  last_name: "Doe",
  email: "jane@doe.com",
  password: "password"
)
u.photo.attach(io: URI.open(Faker::Avatar.image), filename: 'photo.jpg', content_type: 'image/jpeg')
u.save!
puts "Users created !"

puts "Creating 4 alibis"
Alibi.create!(
  title: "Recherche une femme",
  content: "J'ai fais croire a mes parents que j'avais une petite ami et maintenant il veulent la voir j'ai donc besoin d'une personne qui pourra m'aider",
  status: :available,
  goal: :ask,
  category: "family",
  date: Time.now + 5.day,
  reservation_type: :solo,
  price: 1000,
  user: User.find_by(email: 'john@smith.com')
)

Alibi.create!(
  title: "Besoin d'une Homme ",
  content: "J'ai une rendez-vous professionnel mon ex sera présent et je pour faire croire a mon ex que j'ai tourné la page",
  status: :available,
  goal: :ask,
  category: "speak",
  date: Time.now + 2.day,
  reservation_type: :solo,
  price: 5000,
  user: User.find_by(email: 'jane@doe.com')
)
Alibi.create!(
  title: "Sortie cinéma",
  content: "J'ai besoin de companie pour ",
  status: :archived,
  goal: :ask,
  category: "date",
  date: Time.now + 7.day,
  reservation_type: :multi,
  price: 70,
  user: User.find_by(email: 'john@smith.com')
)
Alibi.create!(
  title: "J'ai besoin de faire des photos",
  content: "Je suis créatrice de contenu et je veux faire le couple Goal donc je cherche quelqu'un pour poser avec moi",
  status: :archived,
  goal: :ask,
  category: "date",
  date: Time.now + 9.day,
  reservation_type: :solo,
  price: 1870,
  user: User.find_by(email: 'jane@doe.com')
)
puts "Alibis created !"

puts "Creating 20 users using Faker"
20.times do
  u = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  u.photo.attach(io: URI.open(Faker::Avatar.image), filename: 'photo.jpg', content_type: 'image/jpeg')
  u.save!
end
puts 'Users from Faker created!'

puts 'Creating 40 alibis from Faker'
users = User.all
40.times do
  Alibi.create!(
    title: Faker::Games::Pokemon.move,
    content: Faker::TvShows::Simpsons.quote + '.....',
    status: %i[archived available].sample,
    goal: %i[ask offer].sample,
    category: %w[family date journey speak cinema].sample,
    date: Faker::Date.between(from: '2023-11-24', to: '2026-09-25'),
    reservation_type: %i[solo multi].sample,
    price: rand(1..10000),
    user: users.sample
  )
end
puts 'Alibis from Faker created!'

puts 'Creating 1 booking'
Booking.create!(
  user: User.find_by(email: 'jane@doe.com'),
  alibi: Alibi.find_by(title: 'Recherche une femme')
)
puts 'Booking created!'
