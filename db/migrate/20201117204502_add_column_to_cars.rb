class AddColumnToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :owner_id, :integer
  end
end
