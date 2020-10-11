class RemoveMassageTherapistsColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :massage_therapists, :datetime, :datetime
  end
end
