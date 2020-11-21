class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.integer :owner_id
      t.string :car_model
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
