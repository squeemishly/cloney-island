Rails.application.routes.draw do
  root 'welcome#index'

  get '/search', to: 'search#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create] do
    resources :trips, only: [:new, :index, :create]
  end
end
