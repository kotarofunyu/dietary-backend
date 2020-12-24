# frozen_string_literal: true

Rails.application.routes.draw do
  resources :weights
  resources :users, only: %i[index show create]
  post 'signup', controller: :users, action: :create
  get 'monthly', controller: :monthly_weights, action: :show
end
