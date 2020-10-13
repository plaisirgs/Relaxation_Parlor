# frozen_string_literal: true

class RemoveMassageTherapistsColumn < ActiveRecord::Migration[6.0]
  def up
    remove_column :massage_therapists, :datetime, :datetime
 end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
