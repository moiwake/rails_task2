class AddColumnBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :hotel, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
  end
end
