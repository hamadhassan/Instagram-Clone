# frozen_string_literal: true

Rails.application.routes.draw do
  get 'public/homepage'
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Custom routes
  root to: 'public#homepage'
end
