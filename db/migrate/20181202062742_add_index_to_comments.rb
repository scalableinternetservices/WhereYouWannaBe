class AddIndexToComments < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :event_id
  end
end
