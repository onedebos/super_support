# frozen_string_literal: true

class Api::V1::TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  before_action :authenticate, only: %i[create update destroy]

  def index
    tickets = Ticket.all.order(created_at: :desc)
    render json: { tickets: tickets }
  end

  def create
    if !@user
      render status: 401
    else
      ticket = Ticket.create!(
        user_id: @user.id,
        title: params[:title],
        request: params[:request]
      )
      if ticket
        render json: { ticket: ticket }
      else
        render json: { error: ticket.errors }
      end
    end
  end

  def show
    comments = @ticket.comments.all
    render json: { ticket: @ticket, comments: comments }
  end

  def update
    @ticket.update(ticket_params)
    comments = @ticket.comments.all
    render json: { ticket: @ticket, comments: comments }
  end

  def destroy
    if @user.admin?
      @ticket.destroy
      head :no_content
    else
      render json: { error: 'You are not authorized to perform that action. ' }
    end
  end

  private

  def ticket_params
    params.permit(:status, :id, :ticket, :title, :request)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
