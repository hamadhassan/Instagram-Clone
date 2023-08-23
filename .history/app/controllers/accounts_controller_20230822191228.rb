# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile show]
  def index
    @comment = Comment.new
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids).limit(2)
    @posts = Post.where(account_id: following_ids, private: false)
  end

  def profile
    same_user = @signed_in_account == @account

    if same_user || !@account.private?
      @linked_posts = @account.posts
      @show_picture = true
    else
      # @linked_posts = @account.private_posts
      @show_picture = false
    end
  end

  def follow_account
    current_account.id
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    existing_follower = Follower.find_by(follower_id: current_account.id, following_id:)
    if following_account.private?
      unless existing_follower
        Follower.create!(follower_id: current_account.id, following_id:,
                         accepted: false)
      end
    else
      unless existing_follower
        Follower.create!(follower_id: current_account.id, following_id:,
                         accepted: true)
      end
    end
    redirect_to dashboard_path
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
