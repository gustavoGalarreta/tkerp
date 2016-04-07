class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :collaborators, :role_id, :integer
  end
end
