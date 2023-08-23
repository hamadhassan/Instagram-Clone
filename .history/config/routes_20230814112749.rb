# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard' =>'accounts#index'

  resources :posts 
  # custom routes
  root to: 'public#homepage'

end
