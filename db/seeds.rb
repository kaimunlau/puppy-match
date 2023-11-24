puts "Cleaning db..."
Review.destroy_all
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating owners..."
owner1 = User.create!(
  email: "test@test.com",
  password: "123456",
  first_name: "John",
  last_name: "Doe",
  address: "20 rue des capucins",
  zipcode: "69001",
  city: "Lyon")
puts "User created, email is #{owner1.email}, pw is #{owner1.password}!"

owner2 = User.create!(
  email: "owner@test.com",
  password: "123456",
  first_name: "Toto",
  last_name: "Doe",
  address: "1 boulevard des belges",
  zipcode: "69006",
  city: "Lyon")
puts "User created, email is #{owner2.email}, pw is #{owner2.password}!"

owner3 = User.create!(
  email: "owner2@test.com",
  password: "123456",
  first_name: "Tata",
  last_name: "Doe",
  address: "26 rue mansard",
  zipcode: "69100",
  city: "villeurbanne")
puts "User created, email is #{owner3.email}, pw is #{owner3.password}!"

owner4 = User.create!(
  email: "owner3@test.com",
  password: "123456",
  first_name: "Jo",
  last_name: "Bob",
  address: "13 rue molière",
  zipcode: "69006",
  city: "Lyon")
puts "User created, email is #{owner4.email}, pw is #{owner4.password}!"

owner5 = User.create!(
  email: "owner5@test.com",
  password: "123456",
  first_name: "marie",
  last_name: "Curie",
  address: "70 rue de créqui",
  zipcode: "69006",
  city: "Lyon")
puts "User created, email is #{owner5.email}, pw is #{owner5.password}!"

owner6 = User.create!(
  email: "owner6@test.com",
  password: "123456",
  first_name: "Bernard",
  last_name: "Morin",
  address: "13 rue Garibaldi",
  zipcode: "69006",
  city: "Lyon")
puts "User created, email is #{owner6.email}, pw is #{owner6.password}!"

owner7 = User.create!(
  email: "owner7@test.com",
  password: "123456",
  first_name: "Jean-Claude",
  last_name: "Dusse",
  address: "15 rue Royale",
  zipcode: "69001",
  city: "Lyon")
puts "User created, email is #{owner7.email}, pw is #{owner7.password}!"

owner8 = User.create!(
  email: "owner8@test.com",
  password: "123456",
  first_name: "Jean-Claude",
  last_name: "Dusse",
  address: "11 rue d'Algérie",
  zipcode: "69001",
  city: "Lyon")
puts "User created, email is #{owner8.email}, pw is #{owner8.password}!"

owner9 = User.create!(
  email: "owner9@test.com",
  password: "123456",
  first_name: "Chandler",
  last_name: "Bing",
  address: "4 rue de Belfort",
  zipcode: "69004",
  city: "Lyon")
puts "User created, email is #{owner9.email}, pw is #{owner9.password}!"

owner10 = User.create!(
  email: "owner10@test.com",
  password: "123456",
  first_name: "Monica",
  last_name: "Geller",
  address: "17 allée de valombré",
  zipcode: "69300",
  city: "caluire et cuire")
puts "User created, email is #{owner10.email}, pw is #{owner10.password}!"

owner11 = User.create!(
  email: "owner11@test.com",
  password: "123456",
  first_name: "Rachel",
  last_name: "Green",
  address: "1 rue de nuits",
  zipcode: "69004",
  city: "Lyon")
puts "User created, email is #{owner11.email}, pw is #{owner11.password}!"

owners = [owner1, owner2, owner3, owner4, owner5, owner6, owner7, owner8, owner9, owner10, owner11]

puts "Creating a renter..."
client = User.create!(
  email: "client@test.com",
  password: "123456",
  first_name: "Amy",
  last_name: "Wheeler",
  address: "26 rue des capucins",
  zipcode: "69001",
  city: "Lyon")
puts "Renter created, email is #{client.email}, pw is #{client.password}!"

puts "Creating pets..."
img_urls = ["https://source.unsplash.com/random/?puppy/orientation=landscape"
]

def get_random_name
  possible_names = [Faker::Creature::Dog.unique.name, Faker::Creature::Cat.unique.name, Faker::Artist.unique.name, Faker::FunnyName.unique.name]
  possible_names.sample
end

20.times do
  file = URI.open(img_urls.sample)
  pet = Pet.new(
    name: get_random_name,
    species: "Dog",
    user_id: owners.sample.id,
    description: Faker::ChuckNorris.fact,
    taux_de_succes: rand(50..125.9),
    price: rand(10..99))
  pet.photo.attach(io: file, filename: "puppy.jpg", content_type: "image/jpg")
  pet.save!
  puts "Pet created, name is #{pet.name}!"
end

puts "Creating bookings..."
lucky_owner = owners.select { |owner| owner.pets.count > 0 }.sample
Booking.create!(
  user_id: client.id,
  pet_id: lucky_owner.pets.sample.id,
  start_date: Date.today + 1,
  end_date: Date.today + 3,
  status: "pending")

puts "Done!"
