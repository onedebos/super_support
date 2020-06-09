# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:update]

  def index
    users = User.all.order(created_at: :desc)
    render json: {
      users: users
    }
  end

  def create
    user = User.create!(
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

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
      }, status: 201
    end
  end

  # a route for admins to make other users an admin or agent
  def update
    if @user.admin?
      user = User.find(params[:id])
      user.update(user_params)
      render json: {
        message: 'Successfully made user an admin.',
        user_email: user.email,
        user_role: user.role
      }
    else
      render json: { error: 'You are not authorized to perform that action. ' },
             status: 401
    end
  end

  private

  def user_params
    params.permit(:role, :id)
  end
end
