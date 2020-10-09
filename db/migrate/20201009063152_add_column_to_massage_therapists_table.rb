# frozen_string_literal: true

class AddColumnToMassageTherapistsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :massage_therapists, :biography, :string
  end
end
