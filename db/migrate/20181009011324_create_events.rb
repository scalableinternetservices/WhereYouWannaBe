class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :tag_id
      t.integer :location_id
      t.datetime :date
      t.float :price
      t.integer :user_id

      t.timestamps
    end
  end
end
