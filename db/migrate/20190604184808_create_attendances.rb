class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :attendee, index: true
      t.references :attended_event, index: true
      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id
  end
end
