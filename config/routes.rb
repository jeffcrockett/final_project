Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/reply', to: 'comments#reply'
      get '/frontpage', to: 'posts#frontpage'
      post '/unsubscribe', to: 'subscriptions#unsubscribe'
      resources :comments, :subforums, :posts
      resources :users, only: [:show, :create, :index]
      resources :subscriptions, only: [:create, :destroy]
    end
  end
end
