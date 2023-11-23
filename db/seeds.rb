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

owners = [owner1, owner2, owner3]

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
img_urls = [
  "https://media.4-paws.org/1/e/d/6/1ed6da75afe37d82757142dc7c6633a532f53a7d/VIER%20PFOTEN_2019-03-15_001-2886x1999-1920x1330.jpg",
  "https://www.petlandflorida.com/wp-content/uploads/2022/04/shutterstock_1290320698-1-scaled.jpg",
  "https://images.ctfassets.net/sfnkq8lmu5d7/4Ma58uke8SXDQLWYefWiIt/3f1945422ea07ea6520c7aae39180101/2021-11-24_Singleton_Puppy_Syndrome_One_Puppy_Litter.jpg?w=1000&h=750&fl=progressive&q=70&fm=jpg",
  "https://www.geniuspetfood.co.nz/cdn/shop/articles/Dog_food_for_puppies.jpg?v=1685817287",
  "https://cdn.royalcanin-weshare-online.io/UCImMmgBaxEApS7LuQnZ/v2/eukanuba-market-image-puppy-beagle?w=5596&h=2317&rect=574,77,1850,1045&auto=compress,enhance"
]
20.times do
  file = URI.open(img_urls.sample)
  pet = Pet.new(
    name: Faker::GreekPhilosophers.unique.name,
    species: "Dog",
    user_id: owners.sample.id,
    description: Faker::ChuckNorris.fact,
    price: rand(10..100))
  pet.photo.attach(io: file, filename: "puppy.jpg", content_type: "image/jpg")
  pet.save!
  puts "Pet created, name is #{pet.name}!"
end

puts "Creating bookings..."
Booking.create!(
  user_id: client.id,
  pet_id: owner1.pets.sample.id,
  start_date: Date.today + 1,
  end_date: Date.today + 3,
  status: "pending")

puts "Done!"
