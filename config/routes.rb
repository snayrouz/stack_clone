Rails.application.routes.draw do

  root 'questions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create]
  end

  resources :users
end
