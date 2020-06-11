class AddUserRoleToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_role, :string
  end
end
