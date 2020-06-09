# frozen_string_literal: true

class RemoveCommentsIdFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :comments_id, :foreign_key
  end
end
