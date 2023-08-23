# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # Dashboard
  get '/dashboard' =>
  # Custom routes
  root to: 'public#homepage'
end
