class AddIndexToLocations < ActiveRecord::Migration[5.2]
  def change
    add_index :locations, :name
    add_index :locations, :city
  end
end
