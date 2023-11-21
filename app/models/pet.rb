class Pet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :booking
  has_many_attached :photo

  validates :name, presence: true
  validates :species, presence: true
  validates :price, presence: true, comparison: { greater_than: 0 }
end
