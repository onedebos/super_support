class Api::V1::UsersController < ApplicationController

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

end