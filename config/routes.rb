GuestBook::Application.routes.draw do
  
  resources :people
  root :to=>"people#index"
  post "admin" => "sessions#new"
  resources :sessions,only: [:new, :create, :destroy]
  get "admin" => "sessions#new"
  get "logout" => "sessions#destroy"

end
