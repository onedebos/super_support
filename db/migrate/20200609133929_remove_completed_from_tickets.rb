class RemoveCompletedFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :completed, :boolean
  end
end
