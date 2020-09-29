class CreateMassages < ActiveRecord::Migration[6.0]
  def change
    create_table :massages do |t|
      t.string :type_of_massage
      t.string :time_length
      t.string :price
    end
  end
end
