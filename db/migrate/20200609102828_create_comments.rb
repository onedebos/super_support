# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
