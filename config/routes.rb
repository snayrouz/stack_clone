Rails.application.routes.draw do

  root 'questions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :questions

  resources :users
end
