class RemoveAppointmentsColumn < ActiveRecord::Migration[6.0]
   def up
    remove_column :appointments, :appointment_date, :datetime
 end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
