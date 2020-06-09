Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update] do
        #get tickets created by a user
        resources :tickets, only: [:index]
      end
      post "login", to: "authentication#login"
      resources :tickets do
        resources :comments, only: [:create, :update]
      end
    end
  end
end
