# frozen_string_literal: true

Rails.application.routes.draw do
  get 'public/homepage'
  devise_for :accounts
  
  # Custom routes
  root to: 'public#homepage'
end
