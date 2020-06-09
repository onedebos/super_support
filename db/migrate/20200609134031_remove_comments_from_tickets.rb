# frozen_string_literal: true

class RemoveCommentsFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :comment_id, :foreign_key
  end
end
