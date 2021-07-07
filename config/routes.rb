Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  
  resources :kopis
  resources :origins
  resources :roasts
  resources :orders
  resources :customers

  root to: 'kopis#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
