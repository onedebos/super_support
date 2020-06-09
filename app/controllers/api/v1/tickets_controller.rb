class Api::V1::TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :update, :destroy]
  def index
    tickets = Ticket.all.order(created_at: :desc)
    render json: tickets
  end

  def create
    ticket = Ticket.create!(ticket_params)
    if ticket
        render json: {ticket: ticket } 
    else
        render json: {error: ticket.errors}
    end
  end

  def show
    render json: {ticket: @ticket}
  end

  def update
    @ticket.update(ticket_params)
    render json: {ticket: @ticket}
  end
  
  def destroy
    @ticket.destroy
    head :no_content
  end

  private
    def ticket_params
        params.permit(:completed, :user_id, :comment_id, :title)
    end
  
    def set_ticket
        @ticket = Ticket.find(params[:id])
    end

end