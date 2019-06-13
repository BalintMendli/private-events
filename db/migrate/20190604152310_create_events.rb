class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date

      t.timestamps
    end
    add_reference :events, :creator, foreign_key: true
  end
end
