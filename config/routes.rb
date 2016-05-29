Rails.application.routes.draw do
  namespace :tasks do
    resource :finish, only: [:update, :show]
    resource :toggle_today, only: [:update]
  end
  resources :tasks
  resources :lists, except: :show
  root 'tasks#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
