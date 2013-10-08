AllAboard::Engine.routes.draw do
  resources :boards, only: :index

  namespace :api do
    resources :boards, only: :index
  end

  root to: "boards#index"
end
