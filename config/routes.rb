Rails.application.routes.draw do
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  get '/sign_up', to: 'users#new'
  post '/sign_ip', to: 'sessions#create'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
