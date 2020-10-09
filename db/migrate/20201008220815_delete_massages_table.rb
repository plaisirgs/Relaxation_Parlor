class DeleteMassagesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :massages
  end
end
