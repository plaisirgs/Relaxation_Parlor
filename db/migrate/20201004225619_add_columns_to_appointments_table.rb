class AddColumnsToAppointmentsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :massage_therapist_id, :string
    add_column :appointments, :user_id, :string
  end
end
