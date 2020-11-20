class CreateCampgalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :campgalleries do |t|
      t.integer :camper_id
      t.string :description_1
                        
      t.timestamps
    end
  end
end
