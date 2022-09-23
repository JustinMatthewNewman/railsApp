Rails.application.routes.draw do
  devise_for :users
  resources :coins
  get 'home/signup'
  get 'home/about'
  get 'home/bitcoin'
  get 'home/litecoin'
  get 'home/ripple'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
