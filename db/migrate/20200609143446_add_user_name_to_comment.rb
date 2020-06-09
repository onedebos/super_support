class AddUserNameToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_name, :string
  end
end
