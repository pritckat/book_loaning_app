Rails.application.routes.draw do

  resources :genres
  resources :authors
  resources :loans
  resources :books
  root 'welcome#show'
  resources :users
  
  resources :books do 
    resources :loans, only: [:new, :index]
  end

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  get '/books/:id/return' => "books#return", as: 'return'
  get '/auth/:provider/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
