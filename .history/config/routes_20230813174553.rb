# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # Dash
  get 'public/homepage'
  # Custom routes
  root to: 'public#homepage'
end
