class Pet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :booking
  has_one_attached :photo # replace has_one_attached with has_many_attached if you want to upload multiple photos

  validates :name, presence: true
  validates :species, presence: true
  validates :price, presence: true, comparison: { greater_than: 0 }
end
