class CreateCampgalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :campgalleries do |t|
      t.integer :camper_id
      t.string :picture_1
      t.string :description_1
      t.string :picture_2
      t.string :description_2
      t.string :picture_3
      t.string :description_3
      t.string :picture_4
      t.string :description_4
      t.string :picture_5
      t.string :description_5

      t.timestamps
    end
  end
end
