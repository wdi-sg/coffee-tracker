Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'kopis#index'

  # get '/kopis/new' => 'kopis#new', as: 'new_kopis'
  # post '/kopis' => 'kopis#create'
  # get '/kopis/:id' => 'kopis#show' , as: 'kopi'
  resources :kopis
end