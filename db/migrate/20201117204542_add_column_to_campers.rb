class AddColumnToCampers < ActiveRecord::Migration[6.0]
  def change
    add_column :campers, :owner_id, :integer
  end
end
