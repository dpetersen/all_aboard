AllAboard::Engine.routes.draw do
  resources :boards, only: :index

  namespace :api do
    resources :boards, only: [ :index, :create ]
  end

  root to: "boards#index"
end
