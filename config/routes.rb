Rails.application.routes.draw do
  resources :recipients
  resources :conversations
  resources :messages

  get '/persist', to: 'users#persist'
  post '/login', to: 'users#login'
  resources :users
  
end
