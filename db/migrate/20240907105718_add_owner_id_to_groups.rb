class AddOwnerIdToGroups < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:groups, :owner_id)
      add_column :groups, :owner_id, :integer
    end
  end
end
