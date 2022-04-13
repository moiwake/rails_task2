class HotelUser < ApplicationRecord
  belongs_to :hotel_id
  belongs_to :user_id
end
