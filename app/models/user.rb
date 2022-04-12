class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :introduction, presence: true, on: :renewal
  validates :image, presence: { message: 'を選択してください' }, on: :renewal

  has_many :hotel_users
  has_many :hotels, through: :hotel_users

  has_many :booking_users
  has_many :bookings, through: :booking_users

  has_one_attached :image
end
