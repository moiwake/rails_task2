class AddColumnUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :hotel, foreign_key: true
  end
end
