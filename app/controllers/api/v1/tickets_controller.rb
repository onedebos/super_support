class Api::V1::TicketsController < ApplicationController
  def index
    tickets = Ticket.all.order(created_at: :desc)
    render json: tickets
  end

  def create
    ticket = Ticket.create!(ticket_params)
    if ticket
        render json: ticket
    else
        render json: ticket.errors
    end
  end

  def show
    ticket = Ticket.find(params[:id])
    render json: ticket
  end
end