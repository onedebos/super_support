# frozen_string_literal: true

class AddCommentsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :comments, null: true, foreign_key: true
  end
end
