class Api::V1::UsersController < ApplicationController
    before_action :authenticate, only: [:update]

    def create
        user = User.create!(
            email: params[:email],
            name: params[:name],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            
        )

        if user
            render json: user
        else
            render json: {
                status: 400,
                error: "One of the paramaters required is missing"
            }
        end
    end

    # a route for admins to make other users an admin or agent
    def update
      if @user.admin?
        user = User.find(params[:id])
        user.update(user_params)
        render json: {
            message: "Successfully made user an admin.",
            user: user
        }
      else
        render json: {error: "You are not authorized to perform that action. "}, 
        status: 401
      end
    end

    private

    def user_params
        params.permit(:role, :id)
    end

end