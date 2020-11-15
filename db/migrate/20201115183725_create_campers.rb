class CreateCampers < ActiveRecord::Migration[6.0]
  def change
    create_table :campers do |t|
      t.string :camper_model
      t.string :owner
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
