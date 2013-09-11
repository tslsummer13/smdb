Smdb::Application.routes.draw do

  resources :movies

  resources :directors do
    resources :movies
  end

  # get "/directors/:director_id/movies" => 'movies#index', as: 'director_movies'
  # get "/directors/:director_id/movies/:id" => 'movies#show', as: 'director_movie'
  # get "/directors/:director_id/movies/new" => 'movies#show'
  # post "/directors/:director_id/movies" => 'movies#show'

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
  resources :roles
end
