class DeleteColumnPermissionFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :permission, :string
  end
end
