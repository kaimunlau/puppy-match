module Dashboard
  class UsersController < ApplicationController
    def home
      pets_with_bookings = current_user.pets.select do |pet|
        pet.bookings.any?
      end
      @bookings = pets_with_bookings.map do |pet|
        {
          pet: pet,
          booking: pet.bookings.first,
          total_price: pet.price * (pet.bookings.first.end_date - pet.bookings.first.start_date).to_i
        }
      end
    end
  end
end
