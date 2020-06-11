# frozen_string_literal: true

class Api::V1::CommentsController < ApplicationController
  before_action :set_ticket
  before_action :authenticate

  def create
    comment = Comment.create!(
      user_id: @user.id,
      user_name: @user.name,
      ticket_id: @ticket.id,
      # user_role: @user.role,
      comment: params[:comment]
    )

    if comment
      render json: {
        comment: comment
      }
    else
      render json: {
        error: 'Comment not created'
      }, status: 400

    end
  end

  private

  def comment_params
    params.permit(:ticket_id, :comment, :id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
