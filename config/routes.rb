Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/search', to: 'search#index'
  get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  resources :users, only: [:new, :create]
  resources :trips, only: [:new]
end
