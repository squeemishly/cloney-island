Rails.application.routes.draw do
  root 'welcome#index'

  get '/search', to: 'search#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :destroy] do
    resources :trips, only: [:new, :index, :create, :show]
  end

  namespace :users, path: ":username" do
    get '/trips/change_password', to: 'passwords#reset', as: :password_reset
  end

  resources :confirmations, only: [:new, :create]
end
