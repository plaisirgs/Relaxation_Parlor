class RemoveMassagesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :massages
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
