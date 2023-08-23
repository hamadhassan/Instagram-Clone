# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]
  def index
    @comment = Comment.new
    following_ids = Follower.where(follower_id: current_account.id, accepted: true).map(&:following_id)
    following_ids << current_account.id
    @posts = Post.where(account_id: following_ids)
    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profile
    same_user = @signed_in_account == @account
    if same_user
      @linked_posts = @account.posts
      @show_picture = true
    else
      @show_picture = true
    end
  end



  def follow_account
    follower_id = current_account.id
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    if following_account.private?
      Follower.create!(follower_id:, following_id:,accepted: false)
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
