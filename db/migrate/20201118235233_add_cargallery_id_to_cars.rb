class AddCargalleryIdToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :cargallery_id, :integer
  end
end
