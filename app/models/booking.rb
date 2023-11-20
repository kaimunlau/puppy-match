class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  enum status: %i[accepted pending denied]
end
