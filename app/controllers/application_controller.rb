# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authenticate
    authorization_header = request.headers[:authorization]
    if !authorization_header
      render json: { error: 'not authorized' }, status: 401
    else
      authorization_header = request.headers[:authorization]
      @token = authorization_header.split(' ')[1]
      secret = Rails.application.secrets.secret_key_base[0]
      decoded_token = JWT.decode(@token, secret)
      @user = User.find(decoded_token[0]['user_id'])

    end
  end
end
