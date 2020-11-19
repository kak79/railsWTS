class AddCampgalleryIdToCampers < ActiveRecord::Migration[6.0]
  def change
    add_column :campers, :campgallery_id, :integer
  end
end
