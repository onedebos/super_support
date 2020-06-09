class AddTitleToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :title, :string
  end
end
