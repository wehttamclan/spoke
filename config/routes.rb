Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "welcome#index"
  root controller: :welcome, action: :index

  get '/login', to: 'sessions#new'
  # resources :sessions, only: [:new], path: :login, as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  get '/bike-shop', to: 'accessories#index'
  get '/trips-dashboard', to: 'trips#dashboard'
  get '/stations-dashboard', to: 'stations#dashboard'
  get '/dashboard', to: 'users#dashboard'

  # resources :users, only: [:new, :create, :edit, :update]
  get '/users/new', to: 'users#new', as: :new_user
  post '/users', to: 'users#create'
  put '/users/:id', to: 'users#update', as: :user
  patch '/users/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit', as: :edit_user

  # resources :stations, only: [:index]
  get '/stations', to: 'stations#index', as: :stations

  # resources :trips, only: [:show, :index]
  get '/trips', to: 'trips#index', as: :trips
  get '/trips/:id', to: 'trips#show', as: :trip

  # resources :conditions, only: [:index, :show]
  get '/conditions', to: 'conditions#index', as: :conditions
  get '/conditions/:id', to: 'conditions#show', as: :condition

  get '/conditions-dashboard', to: 'conditions#dashboard'

  # resources :accessories, only: [:show]
  get '/accessories/:id', to: 'accessories#show', as: :accessory

  # resources :carts, only: [:create]
  post '/carts', to: 'carts#create', as: :carts

  namespace :admin do
    # resources :stations, only: [:new, :edit, :create, :update, :destroy]
    # resources :trips, only: [:new, :edit, :create, :update, :destroy]
    # resources :conditions, only: [:new, :edit, :create, :update, :destroy]
    # resources :accessories, only: [:create, :edit, :update]
    # resources :orders, only: [:update]

    get '/bike-shop/new', to: 'accessories#new'
    post '/bike-shop', to: 'accessories#create'
    get '/bike-shop', to: 'accessories#index'
  end

  scope '/admin' do
    get '/stations/new', to: 'admin/stations#new', as: :new_admin_station
    get '/stations/:id/edit', to: 'admin/stations#edit', as: :edit_admin_station
    put '/stations/:id', to: 'admin/stations#update', as: :admin_station
    patch '/stations/:id', to: 'admin/stations#update'
    delete '/stations/:id', to: 'admin/stations#destroy'
    post '/stations', to: 'admin/stations#create', as: :admin_stations

    get '/trips/new', to: 'admin/trips#new', as: :new_admin_trip
    get '/trips/:id/edit', to: 'admin/trips#edit', as: :edit_admin_trip
    put '/trips/:id', to: 'admin/trips#update', as: :admin_trip
    patch '/trips/:id', to: 'admin/trips#update'
    delete '/trips/:id', to: 'admin/trips#destroy'
    post '/trips', to: 'admin/trips#create', as: :admin_trips

    get '/conditions/new', to: 'admin/conditions#new', as: :new_admin_condition
    get '/conditions/:id/edit', to: 'admin/conditions#edit', as: :edit_admin_condition
    put '/conditions/:id', to: 'admin/conditions#update', as: :admin_condition
    patch '/conditions/:id', to: 'admin/conditions#update'
    delete '/conditions/:id', to: 'admin/conditions#destroy'
    post '/conditions', to: 'admin/conditions#create', as: :admin_conditions

    get '/accessories/:id/edit', to: 'admin/accessories#edit', as: :edit_admin_accessory
    put '/accessories/:id', to: 'admin/accessories#update', as: :admin_accessory
    patch '/accessories/:id', to: 'admin/accessories#update'
    post '/accessories', to: 'admin/accessories#create', as: :admin_accessories

    put   '/orders/:id', to: 'admin/orders#update', as: :admin_order
    patch '/orders/:id', to: 'admin/orders#update'
  end

  get '/admin/dashboard', to: 'admin/users#dashboard'
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'

  resources :orders, only: [:create, :show]
  get '/:id', to: 'stations#show', as: :station
end
