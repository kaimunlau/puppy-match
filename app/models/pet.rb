class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking
  has_one_attached :photo # replace has_one_attached with has_many_attached if you want to upload multiple photos

  validates :name, presence: true
  validates :price, presence: true, comparison: { greater_than: 0 }
  validates :photo, presence: true
  validates :description, presence: true
end
