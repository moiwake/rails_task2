class CreateBookingUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
