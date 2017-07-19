Rails.application.routes.draw do
  root 'welcome#index'

  get '/search', to: 'search#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :trips, only: [:new, :index, :create, :show, :edit, :update]
    namespace :vendor do
      get '/dashboard', to: 'dashboard#index'
      resources :tours, except: [:create]
      post '/tours/:id', to: 'tours#create'
    end
  end

namespace :admin do
  get '/dashboard', to: 'dashboard#index'
  get '/query', to: 'query#index', as: 'query'
end

  namespace :users, path: ":id" do
    patch 'change_password/update', to: 'passwords#update', as: :password_patch
    get 'change_password/edit', to: 'passwords#edit', as: :password_edit
    get 'change_password', to: 'passwords#reset', as: :password_reset
  end

  get '/confirmation', to: 'confirmations#show'
  post '/email_confirmation', to: 'confirmations#verify', as: :confirm_email
  get '/email_confirmation', to: 'confirmations#confirm_reset', as: :confirm_reset

  resources :confirmations, only: [:new, :create]

end
