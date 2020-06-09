class Api::V1::CommentsController < ApplicationController
    before_action :set_ticket
    before_action :set_user

    def create
      comment = Comment.create!(
          user_id: @user.id,
          user_name: @user.name,
          ticket_id: @ticket.id,
          comment: params[:comment]
      )

      if comment
        render json: {
            comment: comment,
        }
      else
        render json: {
            error: "Comment not created"
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