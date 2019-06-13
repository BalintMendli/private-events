class AddConfirmationToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :confirmation, :boolean, :default => false
  end
end
