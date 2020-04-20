Rails.application.routes.draw do
  resources :messages

  get '/persist', to: 'users#persist'
  resources :users
  
end
