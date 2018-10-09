class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :guests_count

      t.timestamps
    end
  end
end
