class CreateHotelUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_users do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
