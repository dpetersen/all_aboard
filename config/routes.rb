AllAboard::Engine.routes.draw do
  resources :boards, only: :index

  # These are nested Ember routes.  If they don't exist, Rails tries to serve
  # the route.
  match "/sources" => "boards#index", via: :get

  namespace :api do
    resources :sources, only: [ :index ]
    resources :boards, only: [ :index, :create ]
    resources :slides, only: [ :index ]
  end

  root to: "boards#index"
end
