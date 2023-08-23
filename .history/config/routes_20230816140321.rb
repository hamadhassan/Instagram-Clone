# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  delete '/accounts/sign_out', to: 'devise/sessions#destroy', as: :destroy_account_session

  # dashboard
  get '/dashboard', to:'accounts#index'
  get '/profile/:usernmae', to:'accounts#profile' ,as: :profile

  resources :posts, only: [:new, :create,:show]
  # custom routes
  root to: 'public#homepage'

end
