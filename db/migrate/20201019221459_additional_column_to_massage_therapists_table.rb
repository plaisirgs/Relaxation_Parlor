class AdditionalColumnToMassageTherapistsTable < ActiveRecord::Migration[6.0]
   def change
    add_column :massage_therapists, :price, :integer
  end
end
