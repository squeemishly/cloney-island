Rails.application.routes.draw do
  root 'welcome#index'

  get '/search', to: 'search#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :trips, only: [:new, :index, :create, :show]
  end

  namespace :users, path: ":id" do
    patch '/users/change_password/update', to: 'passwords#update', as: :password_patch
    get '/users/change_password/edit', to: 'passwords#edit', as: :password_edit
    get '/users/change_password', to: 'passwords#reset', as: :password_reset

  end

  resources :confirmations, only: [:new, :create]
end
