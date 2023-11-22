class User < ApplicationRecord
  has_many :bookings
  has_many :pets
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :concat_address
  after_validation :geocode, if: :will_save_change_to_address?

  def concat_address
    [address, zipcode, city].compact.join(', ')
  end
end
