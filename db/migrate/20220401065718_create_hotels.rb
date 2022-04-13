class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :room_name
      t.string :room_introduction
      t.integer :price
      t.string :address
      t.string :image
      t.datetime :start_date
      t.datetime :end_date
      t.integer :person_num

      t.timestamps
    end
  end
end
