# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # Dashboard
  get '/dashboard' =>'accounts#index'
  # Custom routes
  root to: 'public#homepage'
  
end
