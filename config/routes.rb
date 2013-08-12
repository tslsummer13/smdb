Smdb::Application.routes.draw do
  resources :reviews

  # Routes for sign-in/out
  get '/sessions/new' => 'sessions#new', :as => 'new_session'
  post '/sessions' => 'sessions#create', :as => 'sessions'
  delete '/sessions' => 'sessions#destroy', :as => 'session'

  root "movies#index"

  # Routes for the Actor resource:

  resources :actors
  resources :users
  resources :votes
  resources :movies
  resources :directors
  resources :roles
end
