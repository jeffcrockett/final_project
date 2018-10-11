Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :comments
      resources :users, only: [:show, :create, :index]
    end
  end
end
