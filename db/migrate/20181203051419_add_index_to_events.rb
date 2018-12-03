class AddIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :date
    add_index :events, :location_id
    add_index :events, :tag_id
    add_index :events, :user_id
  end
end
