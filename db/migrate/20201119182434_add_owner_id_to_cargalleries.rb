class AddOwnerIdToCargalleries < ActiveRecord::Migration[6.0]
  def change
    add_column :cargalleries, :owner_id, :integer
  end
end
