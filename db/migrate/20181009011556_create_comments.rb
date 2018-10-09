class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :event_id
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
