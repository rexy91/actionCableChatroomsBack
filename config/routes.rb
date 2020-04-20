Rails.application.routes.draw do
  resources :recipients
  resources :conversations
  resources :messages

  get '/persist', to: 'users#persist'
  resources :users
  
end
