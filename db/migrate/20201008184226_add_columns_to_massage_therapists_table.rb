class AddColumnsToMassageTherapistsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :massage_therapists, :datetime, :timestamps
  end
end
