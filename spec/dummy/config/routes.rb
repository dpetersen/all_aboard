Rails.application.routes.draw do
  resource :login, only: [ :show, :create, :destroy ]

  mount AllAboard::Engine => "/all_aboard"
end
