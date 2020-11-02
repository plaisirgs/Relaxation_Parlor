# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboards#show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :massage_therapists do
    resources :appointments
  end
  resources :users
  resources :appointments do
    collection do
      get :user
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
