class CreateCargalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :cargalleries do |t|
      t.integer :car_id
      t.string :description
      
      t.timestamps
    end
  end
end
