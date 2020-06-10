class AddRequestToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :request, :text
  end
end
