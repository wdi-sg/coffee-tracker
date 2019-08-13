Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'kopis#index'
  get '/kopis' => 'kopis#index', as: 'kopis'
  get '/kopis/new' => 'kopis#new', as: 'new_kopi'
  post '/kopis' => 'kopis#create'
  get '/kopis/:id' => 'kopis#show' , as: 'kopi'
  get '/kopis/:id/edit' => 'kopis#edit', as: 'edit_kopi'
  patch '/kopis/:id' => 'kopis#update'
  delete '/kopis/:id' => 'kopis#destroy'

  get '/origins' => 'origins#index', as: 'origins'
  get '/origins/new' => 'origins#new', as: 'new_origin'
  post '/origins' => 'origins#create'
  get '/origins/:id' => 'origins#show' , as: 'origin'
  get '/origins/:id/edit' => 'origins#edit', as: 'edit_origin'
  patch '/origins/:id' => 'origins#update'
  delete '/origins/:id' => 'origins#destroy'

  get '/seeds' => 'seeds#index', as: 'seeds'
  get '/seeds/new' => 'seeds#new', as: 'new_seed'
  post '/seeds' => 'seeds#create'
  get '/seeds/:id' => 'seeds#show' , as: 'seed'
  get '/seeds/:id/edit' => 'seeds#edit', as: 'edit_seed'
  patch '/seeds/:id' => 'seeds#update'
  delete '/seeds/:id' => 'seeds#destroy'


end
