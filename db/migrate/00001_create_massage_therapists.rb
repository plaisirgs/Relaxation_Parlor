# frozen_string_literal: true

class CreateMassageTherapists < ActiveRecord::Migration[6.0]
  def change
    create_table :massage_therapists do |t|
      t.string :first_name
      t.integer :years_of_experience
      t.string :specialty
      t.string :biography
    end
  end
end
