# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  def index
    @comment = Comment.new
    following_account = Account.find_by(id: following_id)
    existing_follower = Follower.find_by(follower_id: current_user.id, following_id: following_id)

    if following_account.private?
      Follower.create!(follower_id: current_user.id, following_id: following_id, accepted: false) unless existing_follower
    else
      Follower.create!(follower_id: current_user.id, following_id: following_id, accepted: true) unless existing_follower
    end

    @posts = Post.where(account_id: following_ids, private: false)
  end

  def profile
    same_user = @signed_in_account== @account

    if same_user || !@account.private?
      @linked_posts = @account.posts
      @show_picture = true
    else
      #@linked_posts = @account.private_posts
      @show_picture = false
    end
  end



  def follow_account
    follower_id = current_account.id
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    Follower.create!(follower_id:, following_id:,accepted: false)
    if following_account.private?
    else
      Follower.create!(follower_id:, following_id:,accepted: true)
    end
    redirect_to dashboard_path
  end


  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
