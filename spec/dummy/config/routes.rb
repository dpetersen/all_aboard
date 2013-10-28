require "resque_web"

Rails.application.routes.draw do
  resource :login, only: [ :show, :create, :destroy ]

  mount ResqueWeb::Engine => "/resque"
  mount AllAboard::Engine => "/all_aboard"
end
