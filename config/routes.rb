Rails.application.routes.draw do
  get 'search', to: "search#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  resources :maps, only: %i[index]
  resources :bookings, only: %i[index]
end
