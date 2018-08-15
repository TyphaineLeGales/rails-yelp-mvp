Rails.application.routes.draw do
  # get '/restaurants', to: 'restaurants#index'
  # get '/restaurants/:id', to: 'restaurants#show'
  # get '/restaurants/new', to: 'restaurants#new'
  # post '/restaurants/', to: 'restaurants#create'

  resources :restaurants, only: [:index, :show, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
