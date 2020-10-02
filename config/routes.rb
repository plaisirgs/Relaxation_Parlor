# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboards#show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :massage_therapists
  resources :users
  resources :appointments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
