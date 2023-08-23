# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts
  # dashboard
  get '/dashboard', to:'accounts#index'
  get '/profile/:username', to:'accounts#profile' ,as: :profile
  # resources :likes do
  #   collection do
  #     get 'save_like/:post_id', to: 'likes#save_like', as: :save_like
  #   end
  # end
  # get 'post/like/:post_id' , to:'likes#save_like' ,as: :like_post
  post "follow/account", to:"accounts#follow_account",as: :follow_account
  resources :posts, only: [:new, :create,:show]
  # custom routes
  root to: 'public#homepage'

end
