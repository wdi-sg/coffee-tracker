Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'kopis#index'
  # get '/kopis' => 'kopis#index', as: 'kopis'
  # get '/kopis/new' => 'kopis#new', as: 'new_kopi'
  # post '/kopis' => 'kopis#create'
  # get '/kopis/:id' => 'kopis#show' , as: 'kopi'
  # get '/kopis/:id/edit' => 'kopis#edit', as: 'edit_kopi'
  # patch '/kopis/:id' => 'kopis#update'
  # delete '/kopis/:id' => 'kopis#destroy'
  resources :kopis
  resources :orders

  get '/stockists' => 'stockists#index', as: 'stockists'
  get '/kopis/:kopi_id/stockists' => 'stockists#index', as: 'kopi_stockists'

  get '/report' => 'reports#index', as: 'reports'

end