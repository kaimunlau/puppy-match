class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  enum status: %i[accepted pending denied]

  validates :user_id, presence: true
  validates :pet_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
