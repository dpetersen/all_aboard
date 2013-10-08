AllAboard::Engine.routes.draw do
  resources :boards, only: :index
end
