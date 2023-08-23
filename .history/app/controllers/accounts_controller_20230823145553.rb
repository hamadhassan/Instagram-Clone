# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile]
  def index
    @comment = Comment.new
    following_ids = Follower.where(following_id: current_account.id).map(&:follower_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids).limit(2)

    #@posts = Post.joins(:followers).where(followers: { accepted: true })
    @posts = Post.joins(account: :followers).where(followers: { accepted: true ,following_id: current_account.id})

    #@posts = Post.where(account_id: following_ids, private: false)
  end

  def profile
    if current_account == @account
      @linked_posts = @account.posts
      @show_picture = true
    elsif !current_account.private?
      <$#->
      following_ids = Follower.where(following_id: current_account.id).map(&:follower_id)
      following_ids << current_account.id
      @linked_posts = Post.where(account_id: following_ids, private: false)
      @show_picture = true
    elsif current_account.private?
      @linked_posts=Post.joins(account: :followers).where(followers: { accepted: true ,following_id: current_account.id})
      @show_picture = true
    else
      @show_picture = false
    end
  end

  def follow_account
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    existing_follower = Follower.find_by(follower_id: current_account.id, following_id:)

    if following_account.private?
      create_follower(following_id, current_account.id, false) unless existing_follower
    else
      create_follower(following_id, current_account.id, true) unless existing_follower
    end

    redirect_to dashboard_path
  end

  def accept_follow_request
    following_id = params[:follow_id]
    following_account = Account.find_by(id: following_id)
    follower = Follower.find_by(following_id: following_account.id, follower_id: current_account.id)
    return unless follower

    follower.update(accepted: true)
  end

  private

  def create_follower(follower_id, following_id, accepted)
    Follower.create!(following_id:, follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
