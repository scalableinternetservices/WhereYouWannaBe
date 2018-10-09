class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.integer :capacity
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
