class RemoveImageFromHotels < ActiveRecord::Migration[7.0]
  def change
    remove_column :hotels, :image, :string
  end
end
