Rails.application.routes.draw do


  root 'questions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post 'tokens' => "tokens#create"
  resources :users

  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create]
  end

  resources :answers do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create]
  end

  resources :tags
  resources :chat
end
