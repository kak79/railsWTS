class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :owner
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
