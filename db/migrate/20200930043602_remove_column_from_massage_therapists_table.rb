class RemoveColumnFromMassageTherapistsTable < ActiveRecord::Migration[6.0]
    def change
    remove_column :massage_therapists, :biography
  end

end
