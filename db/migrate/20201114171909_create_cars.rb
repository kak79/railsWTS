class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name_brand
      t.string :car_model
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
