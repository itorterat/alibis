require "open-uri"

def create_user_with_optional_photo(first_name, last_name)
  email = "#{first_name.downcase}@#{last_name.downcase}.com"
  password = "password"

  u = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  )

  if rand(1..4) > 1
    u.photo.attach(io: URI.open(Faker::Avatar.image), filename: 'photo.jpg', content_type: 'image/jpeg')
  end

  u.save!
  puts "User #{u.email} created! #{u.photo.attached? ? (" Photo was attached.") : (" No photo attached this time.")}"
end

users = [%w[John Smith], %w[Jane Doe], %w[Irvin Nivri], %w[Rym Myr], %w[Lilian Nailil], %w[Yaya Ayay], %w[Sabrina Anirbas], %w[Hugo Oguh], %w[Alexis Sixela], %w[Fatma Amtaf]]

puts 'Create all users'
users.each do |first_name, last_name|
  create_user_with_optional_photo(first_name, last_name)
end
puts 'All users created!'

users = User.all

puts 'Creating all alibis'
puts 'Create Alibi 1'
alibi = Alibi.new(
  title: "Une petite amie à présenter au dîner de famille?",
  content: "Vous avez besoin de présenter une fausse petite amie à votre famille durant les prochaines fêtes de Noël? Si c’est le cas je suis disponible pour parler d’une fabuleuse histoire d’amour!",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :family,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 1 created'
alibi.save!

puts 'Create Alibi 2'
alibi = Alibi.new(
  title: "Un homme qui vous écoute",
  content: "Vous avez besoin de parler à un homme? Je suis disponible si besoin pour vous écouter ou pour parler.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 2 created'
alibi.save!

puts 'Create Alibi 3'
alibi = Alibi.new(
  title: "Besoin d’un date avec une femme?",
  content: "Je suis disponible pour un rendez-vous avec un homme et pour être présenté à ses collègues, amis, famille si besoin.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 3 created'
alibi.save!

puts 'Create Alibi 4'
alibi = Alibi.new(
  title: "Disponible pour un dates avec une femme",
  content: "Vous avez besoin d’un faux dates autour d’un dîner ou d’un rendez-vous en général? Je suis disponible si besoin.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 4 created'
alibi.save!

puts 'Create Alibi 5'
alibi = Alibi.new(
  title: "Disponible pour un film humoristique",
  content: "Je suis disponible pour aller voir des films humoristiques et rire avec vous. Je suis de naturel sociable et j’adore les films où l’on ne fait que rire.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 5 created'
alibi.save!

puts 'Create Alibi 6'
alibi = Alibi.new(
  title: "Faux dates pour le réveillon de noël ça vous dit?",
  content: "Je suis loin de ma famille pour les fêtes de noël, je souhaite donc dîner avec quelqu’un pour le réveillon afin de ne pas le passer complétement tout seul.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 6 created'
alibi.save!

puts 'Create Alibi 7'
alibi = Alibi.new(
  title: "Un faux dîner romantique ça vous va?",
  content: "Je souhaitais aller dîner dans un célèbre restaurant 5 étoiles avec ma petite amie. J’ai dû réserver 7 mois à l’avance et entre temps on a rompu. Mais je souhaite toujours y aller.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 7 created'
alibi.save!

puts 'Create Alibi 8'
alibi = Alibi.new(
  title: "Comme par magie avec Kev Adams",
  content: "Le film humoristique comme par magie est sortie au cinéma et j’ai très envie de le voir mais pas mes amis. Je souhaite y aller avec une personne pour me sentir moi seule. Le genre n’est pas important.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 8 created'
alibi.save!

puts 'Create Alibi 9'
alibi = Alibi.new(
  title: "Le film Napoléon est sortie au cinéma!",
  content: "J’ai longtemps hésité à le voir mais après les retours positifs que j’ai lus je souhaite sauter le pas et aller voir ce film au cinéma. Mais dans mon entourage personne ne veux y aller avec moi. Le film à l’air trop ennuyeux pour eux.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 9 created'
alibi.save!

puts 'Create Alibi 10'
alibi = Alibi.new(
  title: "Film le consentement?",
  content: "Le film le consentement est sortie au cinéma, j’ai très envie de le voir mais aucun de mes amis n’est intéressée pour voir ce genre de film. Je recherche quelqu’un d’intéressé pour le regarder avec moi au cinéma.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 10 created'
alibi.save!

puts 'Create Alibi 11'
alibi = Alibi.new(
  title: "Qu’est ce que vous aimez mesdames?",
  content: "Bonjour, je souhaite draguer une femme mais je ne m’y connais vraiment pas ni en femme, ni en drague. Je souhaite discuter avec une femme pour lui demander conseil.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 11 created'
alibi.save!

puts 'Create Alibi 12'
alibi = Alibi.new(
  title: "Je veux comprendre les hommes",
  content: "Bonjour, je suis récemment entré en couple pour la première fois avec un homme mais je n’arrive pas du tout à le comprendre. Je n’ai pas d’amis garçon à qui poser la question, je souhaite donc voir un homme pour lui poser les questions que j’ai dans la tête.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 12 created'
alibi.save!

puts 'Create Alibi 13'
alibi = Alibi.new(
  title: "Envie d’un safari?",
  content: "Avec des amis nous souhaitons faire un safari au Kenya pour lequel il faut être 6. Mais depuis deux de nos amis ont rompu avec leurs partenaires respectifs. Il nous manque donc deux personnes pour être au complet.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 13 created'
alibi.save!

puts 'Create Alibi 14'
alibi = Alibi.new(
  title: "Safaris au Kenya",
  content: "Je souhaite faire un safari au Kenya, voir les animaux sauvage dans leur milieu naturel et me faire pleins de bon souvenirs. Mais ça ne tente personne dans mes connaissances.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 14 created'
alibi.save!

puts 'Create Alibi 15'
alibi = Alibi.new(
  title: "Envie de voir des aurores boréales?",
  content: "Je veux aller visiter le Groenland en hiver pour voir des aurores boréales pour la première fois de ma vie. Mais personne ne veux m’accompagner parce qu’il fera trop froid…",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 15 created'
alibi.save!

puts 'Create Alibi 16'
alibi = Alibi.new(
  title: "Partant pour un week-end à Berlin?",
  content: "Bonjour, je pars pour un week-end à Berlin pour visiter et je souhaite que quelqu’un m’accompagne. Par contre étant moi-même un homme, je préfère être accompagné par un autre homme.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 16 created'
alibi.save!

puts 'Create Alibi 17'
alibi = Alibi.new(
  title: "Besoin d’amis maman",
  content: "J’ai annoncé à mon mari que j’allais partir en voyage avec des amies maman que me suis faite au RAM. Mais en fait j’y vais avec mon amant. J’ai besoin de trois faux amies maman à présenter à mon mari.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :family,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 17 created'
alibi.save!

puts 'Create Alibi 18'
alibi = Alibi.new(
  title: "Besoin de faux collègues en urgence",
  content: "J’ai fait croire à ma femme que j’avais des soirées au bar avec mes collègues pour lui cacher mon infidélité. Mais maintenant elle souhaite les voir…",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :family,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 18 created'
alibi.save!

puts 'Create Alibi 19'
alibi = Alibi.new(
  title: "Des parents à présenter",
  content: "J’ai fait n’importe quoi à l’un de mes cours et maintenant le prof veut voir mes parents. Mais juste avant noël impossible que je leur en parle. J’ai besoin de deux personnes pour se faire passer pour mes parents.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 19 created'
alibi.save!

puts 'Create Alibi 20'
alibi = Alibi.new(
  title: "Faux amis à présenter en urgence",
  content: "J’ai besoin de faux amis à présenter à ma compagne durant un diner de présentation, pour éviter de lui présenter mes amis.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 20 created'
alibi.save!

puts 'Create Alibi 21'
alibi = Alibi.new(
  title: "Besoin de faux parents en urgence",
  content: "J’ai promis à ma petite amie que j’allais luis présenter mes parents après qu’elle m’a harcelé sur le sujet. Mais jamais je ne pourrai lui présenter mes parents!",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :family,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 21 created'
alibi.save!

puts 'Create Alibi 22'
alibi = Alibi.new(
  title: "Dispo pour un voyage",
  content: "Bonjour, je suis disponible pour aller en voyage si besoin. Pour la destination, aucun pays froids accepté!",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 22 created'
alibi.save!

puts 'Create Alibi 23'
alibi = Alibi.new(
  title: "Dispo pour aller voir un film",
  content: "Je suis disponible pour aller voir des films. Je suis plutôt film d’animation et film d’horreur mais je suis aussi ouverte aux propositions!",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 23 created'
alibi.save!

puts 'Create Alibi 24'
alibi = Alibi.new(
  title: "Quelqu’un à qui parler?",
  content: "Je peux vous écouter si vous avez besoin de quelqu’un à qui parler, alors n’hésitez pas à me contacter si besoin.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 24 created'
alibi.save!

puts 'Create Alibi 25'
alibi = Alibi.new(
  title: "Besoin d’une femme?",
  content: "Bonjour je suis actuellement libre pour servir d’amie, de petit amie ou de compagne, si vous en avez besoin.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :family,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 25 created'
alibi.save!

puts 'Create Alibi 26'
alibi = Alibi.new(
  title: "Besoin d’un fiancé pour aller crasher le mariage de mon ex!",
  content: "Aujourd’hui j’ai appris que mon ex aller se marier durant le prochain été et il a eu l’audace de m’inviter!! Je suis actuellement célibataire mais j’ai besoin d’un bel homme pour se faire passer pour mon petit amis et l’humilier durant son mariage en me demandant ma main pendant la cérémonie!",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 26 created'
alibi.save!

puts 'Create Alibi 27'
alibi = Alibi.new(
  title: "Besoin d’une femme en urgence!",
  content: "Contexte : Je me suis récemment séparé de mon ex, que j’aime toujours. Mais elle s’est déjà trouvé un petit amis pour me remplacer! Je sais qu’ils vont partir en rendez-vous dans NOTRE restaurant! J'ai besoin de quelqu’un pour m’accompagner en “dîner romantique” et la rendre jalouse!",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :date,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 27 created'
alibi.save!

puts 'Create Alibi 28'
alibi = Alibi.new(
  title: "Tenté d’aller voir le dernier film Ghibli gratuitement au cinéma?",
  content: "Je veux aller voir le dernier film Ghibli au cinéma. Je suis un grand fan! Mais tous mes amis sont des grands machos avec qui je ne pourrai jamais aller voir autre chose au cinéma que le dernier Fast and Furious…",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 28 created'
alibi.save!

puts 'Create Alibi 29'
alibi = Alibi.new(
  title: "Tenté d’aller voir le dernier film Ghibli gratuitement au cinéma?",
  content: "Je veux aller voir le dernier film Ghibli au cinéma. Je suis un grand fan! Mais tous mes amis sont des grands machos avec qui je ne pourrai jamais aller voir autre chose au cinéma que le dernier Fast and Furious…",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 29 created'
alibi.save!

puts 'Create Alibi 30'
alibi = Alibi.new(
  title: "nvie d’aller voir le dernier Saw au ciné gratuitement?",
  content: "Le dernier Saw est sorti!! Je veux absolument aller le voir mais personne dans mes connaissances n’aiment les films d’horreur… Et je n’ai pas envie d’aller le voir tout seul, je trouve ça triste.",
  status: %i[available available archived available].sample,
  goal: :offer,
  category: :cinema,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
p 'Alibi 30 created'
alibi.save!

puts 'Create Alibi 31'
alibi = Alibi.new(
  title: "Envie d’un voyage de luxe tout frais payé?",
  content: "J’ai gagné un voyage de luxe d’une semaine tout frais payé à NY! Mais malheureusement aucun membre de ma famille, ni amis n’est libre pour m’accompagner. Mais pour le prix… franchement un voyage de luxe gratuit et vous voulez que je vous paye en plus…",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :journey,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
  p 'Alibi 31 created'
alibi.save!

puts 'Create Alibi 32'
alibi = Alibi.new(
  title: "Une personne à qui parler de ma vie",
  content: "Je me suis récemment embrouillé avec toutes mes amies et ma famille ne veut plus me voir tant que je ne me serai pas excusé. Mais n'étant pas en tort, je refuse de le faire. Je suis donc actuellement toute seule et isolée. J’ai besoin de quelqu’un à qui parler et écouter autour d’un bon déjeuné.",
  status: %i[available available archived available].sample,
  goal: :ask,
  category: :speak,
  date: Time.now + rand(-345600..345600).seconds,
  reservation_type: %i[solo multi].sample,
  price: rand(1..10000),
  user: users.sample
)
if rand(1..4) > 1
  alibi.photo.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'photo.jpg', content_type: 'image/jpeg')
  p 'Photo attached'
end
  p 'Alibi 32 created'
alibi.save!
puts 'All alibis created!'

Alibi.find_each do |alibi|
  potential_users = User.where.not(id: alibi.user.id)

  users_with_bookings = alibi.bookings.select(:user_id).distinct.pluck(:user_id)
  potential_users = potential_users.where.not(id: users_with_bookings)

  rand(3..4).times do
    user = potential_users.sample
    status = %w[approved declined pending cancelled].sample

    booking = Booking.new(alibi: alibi, user: user, status: status)

    if booking.save
      puts "Booking created with status #{booking.status} for alibi #{alibi.id} and user #{user.id}"
    else
      puts "Failed to create booking: #{booking.errors.full_messages.join(', ')}"
    end

    potential_users = potential_users.where.not(id: user.id)
  end
end
