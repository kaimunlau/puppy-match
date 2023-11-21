class Review < ApplicationRecord
  belongs_to :pet
  has_one :booking
  has_one :user, through: :booking
end
