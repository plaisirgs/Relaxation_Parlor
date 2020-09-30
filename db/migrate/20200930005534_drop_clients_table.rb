# frozen_string_literal: true

class DropClientsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :clients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
