Rails.application.routes.draw do
  resources :exampleitems, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]

  post '/login/', to: "users#login"
  get '/checkin/', to: "users#checkin"

  get '/lists/', to: 'lists#index'
  post '/lists/', to: 'lists#create'
  get '/lists/:index', to: 'lists#show'
  delete '/lists/:id', to: 'lists#delete'
  patch 'lists/:id', to: 'lists#update'
  # get 'exampleitems/categories', to: "exampleitems#categories"

end
