class BookingHotel < ApplicationRecord
  belongs_to :hotel_id
  belongs_to :booking_id
end
