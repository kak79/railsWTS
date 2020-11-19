class AddOwnerIdToCampgalleries < ActiveRecord::Migration[6.0]
  def change
    add_column :campgalleries, :owner_id, :integer
  end
end
