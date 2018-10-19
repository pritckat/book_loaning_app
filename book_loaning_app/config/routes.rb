Rails.application.routes.draw do

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
