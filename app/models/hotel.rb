class Hotel < ApplicationRecord
  has_many :hotel_users
  has_many :users, through: :hotel_users

  has_many :booking_hotels
  has_many :bookings, through: :booking_hotels

  has_one_attached :image

  validates :room_name, :room_introduction, :price, :address, presence: true
  validates :image, presence: { message: 'を選択してください' }
  validates :price,numericality: true
end
