# frozen_string_literal: true

Rails.application.routes.draw do
  resources :weights, { :format => 'json' }
  resources :users, only: %i[index show create]
  resources :tags, only: %i[index create update destroy]
  post 'signup', controller: :users, action: :create
  get 'monthly', controller: :monthly_weights, action: :show
  post 'auth' => 'auth#create'
  post 'session' => 'session#create'
  delete 'session' => 'session#destroy'

end
