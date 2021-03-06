AllAboard::Engine.routes.draw do
  resources :boards, only: [ :index ]

  # These are nested Ember routes.  If they don't exist, Rails tries to serve
  # the route.
  match "/board/*path" => "boards#index", via: :get
  match "/sources" => "boards#index", via: :get
  match "/sources/*path" => "boards#index", via: :get

  namespace :api do
    resources :sources, only: [ :index, :show ]
    resources :configurable_attributes, only: [ :index, :update ]
    resources :boards, only: [ :index, :create, :show ]
    resources :slides, only: [ :index, :create, :show ]
    resources :perspective_assignments, only: [ :create, :update, :destroy ]
    resources :updates, only: :index
  end

  root to: "boards#index"
end
