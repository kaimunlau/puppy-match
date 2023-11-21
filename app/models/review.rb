class Review < ApplicationRecord
  belongs_to :booking
  has_one :booking
  has_one :user, through: :booking
end
