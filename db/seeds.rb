puts "Cleaning db..."
Review.destroy_all
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating a user..."
user1 = User.create!(
  email: "test@test.com",
  password: "123456",
  first_name: "John",
  last_name: "Doe",
  address: "1 rue de la paix",
  zipcode: "75000",
  city: "Paris")
puts "User created, email is #{user1.email}, pw is #{user1.password}!"

user2 = User.create!(
  email: "client@test.com",
  password: "654321",
  first_name: "Amy",
  last_name: "Wheeler",
  address: "175 Rue Saint-Denis",
  zipcode: "75000",
  city: "Paris")
puts "Renter created, email is #{user2.email}, pw is #{user2.password}!"

puts "Creating pets..."
2.times do
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    species: "Dog",
    user_id: user1.id,
    price: rand(10..100))
  puts "Pet created, name is #{pet.name}!"
end

puts "Done!"
