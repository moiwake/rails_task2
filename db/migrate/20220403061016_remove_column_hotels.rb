class RemoveColumnHotels < ActiveRecord::Migration[7.0]
  def change
    remove_column :hotels, :start_date
    remove_column :hotels, :end_date
    remove_column :hotels, :person_num
  end
end
