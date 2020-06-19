# frozen_string_literal: true

class RemoveRoleAndAdminFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :role, :string
    remove_column :users, :admin, :boolean
  end
end
