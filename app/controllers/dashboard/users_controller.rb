module Dashboard
  class UsersController < ApplicationController
    def home
      pets_with_bookings = current_user.pets.select do |pet|
        pet.bookings.any?
      end
      @my_pet_bookings = make_my_pet_bookings(pets_with_bookings)

      @my_bookings = make_my_bookings(current_user.bookings)

      @pet = Pet.new
    end

    private

    def make_my_pet_bookings(pets)
      pets.map do |pet|
        {
          pet:,
          booking: pet.bookings.first,
          total_price: pet.price * (pet.bookings.first.end_date - pet.bookings.first.start_date).to_i
        }
      end
    end

    def make_my_bookings(bookings)
      bookings.map do |booking|
        {
          booking:,
          pet: booking.pet,
          total_price: booking.pet.price * (booking.end_date - booking.start_date).to_i
        }
      end
    end
  end
end
