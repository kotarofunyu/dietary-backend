# frozen_string_literal: true

Rails.application.routes.draw do
  resources :weights
  resources :users, only: %i[index show create]
  post 'signup', controller: :users, action: :create
  post 'signin', controller: :sessions, action: :create
  delete 'signin', controller: :sessions, action: :destroy
  post 'refresh', controller: :refresh, action: :create
end
