class AddAdditionalColumnToAppointmentsTable < ActiveRecord::Migration[6.0]
  def change
        add_column :appointments, :appointment_date, :datetime
  end
end
