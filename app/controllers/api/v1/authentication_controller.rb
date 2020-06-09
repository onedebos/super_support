# frozen_string_literal: true

class Api::V1::AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      secret = Rails.application.secrets.secret_key_base[0]
      payload = {
        user_id: user.id,
        name: user.name,
        email: user.email,
        role: user.role
      }
      token = JWT.encode(payload, secret)
      render json: {
        token: token,
        user: payload
      }
    else
      render json: {
        error: 'invalid email or password'
      }, status: 401
    end
  end
end
