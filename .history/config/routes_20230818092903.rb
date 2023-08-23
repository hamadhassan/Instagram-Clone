# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to:'accounts#index'
  get '/profile/:usernaae', to:'accounts#profile' ,as: :profile
  get 'post/like/:post_id' , to:'likes#save_like' ,as: :like_post

  resources :posts, only: [:new, :create,:show]
  # custom routes
  root to: 'public#homepage'

end
