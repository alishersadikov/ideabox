Rails.application.routes.draw do

  root 'sessions#new'
  resources :users

  resources :ideas, only: [:index, :show, :new, :create]

  namespace :admin do
    resources :categories
    resources :images
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  match '*path', to: redirect('/'), via: :all

end
