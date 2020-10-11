# frozen_string_literal: true

class RemoveAppointmentsColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :appointment_date, :datetime
  end
end
