Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      post '/login', to: 'auth#create'
      resources :comments
      resources :users, only: [:show, :create]
    end
  end
end
