Rails.application.routes.draw do

  resources :messages

  resources :rooms
  get '/persist', to: 'users#persist'
  post '/login', to: 'users#login'
  resources :users

  mount ActionCable.server => '/cable'
end
