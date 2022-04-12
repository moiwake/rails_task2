class CreateBookingHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_hotels do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
