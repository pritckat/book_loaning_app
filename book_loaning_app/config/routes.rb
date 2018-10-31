Rails.application.routes.draw do

  resources :authors, only: [:index, :show]
  resources :loans, only: [:new, :create, :index]
  resources :books
  root 'welcome#show'
  resources :users
  
  resources :books do 
    resources :loans, only: [:new, :index]
  end

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#create'

  resources :books do
    get 'return', on: :member
  end

  resources :users do
    get 'lending', on: :member
  end
  
  resources :users do
    resources :books, only: [:index]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
