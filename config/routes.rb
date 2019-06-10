Rails.application.routes.draw do
  root 'events#index'
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  get '/sign_up', to: 'users#new'
  post '/sign_in', to: 'sessions#create'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :show, :index]
end
