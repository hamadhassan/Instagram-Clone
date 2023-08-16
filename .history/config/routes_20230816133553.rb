# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  delete '/accounts/sign_out', to: 'sessions#destroy'

  # dashboard
  get '/dashboard', to:'accounts#index'

  resources :posts, only: [:new, :create,:show]
  # custom routes
  root to: 'public#homepage'

end
