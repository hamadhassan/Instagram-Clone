# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to:'accounts#index'
  get '/profile/:usernmae', to:'accounts#profile' ,as: :profile
  get "post/like/:post_id" , to:'likes#save_like' ,as: :save_like

  resources :posts, only: [:new, :create,:show]
  # custom routes
  root to: 'public#homepage'

end
