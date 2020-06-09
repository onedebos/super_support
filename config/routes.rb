# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create update index] do
        # get tickets created by a user
        resources :tickets, only: [:index]
      end
      post 'login', to: 'authentication#login'
      resources :tickets do
        resources :comments, only: %i[create update]
      end
    end
  end
end
