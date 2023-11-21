class Pet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :booking
  has_many_attached :photo
end
