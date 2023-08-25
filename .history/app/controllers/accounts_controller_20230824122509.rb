# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile]
  def index
    @comment = Comment.new
    # following_ids = Follower.where(following_id: current_account.id).map(&:follower_id)
    # following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids).limit(2)
    # @posts = Post.joins(account: :followers).where(followers: { accepted: true,
    #                                                             following_id: current_account.id }).distinct
    #Testing Purpose
    @posts=Post.all
    #@follower_suggestions=Account.all
  end

  def profile
    if current_account == @account
      @linked_posts = @account.posts
      @show_picture = true
    elsif current_account.private?
      # Public account
      @linked_posts = @account.posts
      @show_picture = true
    else
      @show_picture = false
    end
  end

  def accept_follow_request
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    follower = Follower.find_by(following_id: following_account.id, follower_id: current_account.id)
    return unless follower

    follower.update(accepted: true)
    redirect_to dashboard_path
  end

  private

  def create_follower(following_id, follower_id, accepted)
    Follower.create!(following_id:, follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
