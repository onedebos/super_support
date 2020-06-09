class Api::V1::TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :update, :destroy]
    before_action :set_user
  def index
    tickets = Ticket.all.order(created_at: :desc)
    render json: tickets
  end

  def create
    if !@user
        render status: 401
    else
      if params[:completed] == nil
        completed = false
      end
      ticket = Ticket.create!(
          user_id: @user.id, 
          title: params[:title], 
          completed: completed 
          )
      if ticket
        render json: {ticket: ticket } 
      else
        render json: {error: ticket.errors}
      end
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

    def set_user
      authorization_header = request.headers[:authorization]
      if !authorization_header
        render json: {error: "not authorized"}, status: 401
      else
        authorization_header = request.headers[:authorization]
        token = authorization_header.split(' ')[1]
        secret = Rails.application.secrets.secret_key_base[0]
        decoded_token = JWT.decode(token, secret)
        @user = User.find(decoded_token[0]["user_id"])
      end
    end

end