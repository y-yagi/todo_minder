Rails.application.routes.draw do
  namespace :tasks do
    resource :finish, only: [:update, :show]
    resource :start, only: [:update]
    resource :wait, only: [:update]
  end
  resources :tasks
  resources :lists, except: :show
  resource :user, only: [:edit, :update], as: :my
  root 'tasks#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
