Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '/report' => 'reports#index'
  resources :orders
  resources :kopis
  resources :origins
  resources :roasts
  resources :customers


end
