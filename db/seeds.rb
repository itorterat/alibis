puts 'Creating 2 user for pitch and test...'

User.create(
  first_name: "John",
  last_name: "Smith",
  email: "john@smith.com",
  password: "password"
)
User.create(
  first_name: "Jane",
  last_name: "Doe",
  email: "jane@doe.com",
  password: "password"
)

puts "User created !"

puts "Creating 4 alibis for the pitch and test..."

Alibi.create(
  title: "Recherche une femme",
  content: "J'ai fais croire a mes parents que j'avais une petite ami et maintenant il veulent la voir j'ai donc besoin d'une personne qui pourra m'aider",
  status: :available,
  category: "family",
  date: Time.now + 5.day,
  image: "",
  price: 1000,
  user_id: User.find_by(email: 'john@smith.com').id
)
Alibi.create(
  title: "Besoin d'une Homme ",
  content: "J'ai une rendez-vous professionnel mon ex sera présent et je pour faire croire a mon ex que j'ai tourné la page",
  status: :available,
  category: "speak",
  date: Time.now + 2.day,
  image: "",
  price: 5000,
  user_id: User.find_by(email: 'jane@doe.com').id
)
Alibi.create(
  title: "Sortie cinéma",
  content: "J'ai besoin de companie pour ",
  status: :archived,
  category: "date",
  date: Time.now + 7.day,
  image: "",
  price: 70,
  user_id: User.find_by(email: 'john@smith.com').id
)
Alibi.create(
  title: "J'ai besoin de faire des photos",
  content: "Je suis créatrice de contenu et je veux faire le couple Goal donc je cherche quelqu'un pour poser avec moi",
  status: :archived,
  category: "date",
  date: Time.now + 9.day,
  image: "",
  price: 1870,
  user_id: User.find_by(email: 'jane@doe.com').id
)
puts "Alibis created !"

puts "Creating 20 users by Faker"

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
    content: Faker::TvShows::Simpsons.quote + '.....',
    status: [0, 1].sample,
    category: %w[family date journey speak cinema].sample,
    date: Faker::Date.between(from: '2023-11-24', to: '2026-09-25'),
    image: Faker::Avatar.image,
    price: rand(1..10000),
    user: users.sample
  )
end
puts 'Alibis created!'

puts 'Creating 1 booking...'
Booking.create(
  status: :pending,
  user_id: User.find_by(email: 'jane@doe.com').id,
  alibi_id: Alibi.find_by(title: 'Recherche une femme').id
)
puts 'Booking created!'
