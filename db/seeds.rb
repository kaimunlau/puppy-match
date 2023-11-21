puts "Cleaning db..."
Review.destroy_all
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating a user..."
user = User.create!(
  email: "test@test.com",
  password: "123456",
  first_name: "John",
  last_name: "Doe",
  address: "1 rue de la paix",
  zipcode: "75000",
  city: "Paris")
puts "User created, email is #{user.email}, pw is #{user.password}!"

puts "Creating pets..."
2.times do
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    species: "Dog",
    user_id: user.id,
    price: rand(10..100))
  puts "Pet created, name is #{pet.name}!"
end

puts "Done!"
