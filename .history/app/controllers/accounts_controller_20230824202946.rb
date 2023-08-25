# frozen_string_literal: true

# This is the controller responsible for managing user accounts.
class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[profile index]
  before_action :find_post, only: %i[like_user_post unlike_user_post]


  def index
    @comment = Comment.new
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids + [current_account.id]).limit(5)

    # Get the private posts if the account folow request acepted is true
    # following_ids_list = current_account.following.pluck(:id)
    # accepted_following_accounts = Account.joins(:following_accounts).where(relationships: { accepted: false }).distinct
    # @posts = Post.where(account_id: following_ids_list,private: true, account: accepted_following_accounts)

    # @posts = Post.where(account_id: following_ids_list,private: false)

    #  @posts = @posts.or(private_posts)
    #  @posts = @posts.order(created_at: :desc)
    @posts=Post.all

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
  def follower_suggestions
    following_ids = Relationship.where(follower_id: current_account.id).map(&:following_id)
    @follower_suggestions = Account.where.not(id: following_ids + [current_account.id])
    current_account_id = current_account.id
    @private_accounts_request = Account.joins(:followed_accounts)
                 .where(followed_accounts: { following_id: current_account_id, accepted: false })
  end
  def like_user_post
    @post = Post.find(params[:post_id]) # Find the post by ID
    pre_like = @post.likes.find_by(account_id: current_account.id)

    if pre_like
      flash[:notice] = 'You have already liked this post.'
    else
      like = @post.likes.create(account_id: current_account.id, liked: true)
      if like.valid?
        flash[:success] = 'You liked this post.'
      else
        # Handle the case where the like couldn't be saved
        flash[:error] = 'Failed to like the post.'
      end
    end

    # Redirect back to the post or wherever you want
    redirect_to @post
  end
  def unlike_user_post
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(account_id: current_account.id, liked: true)
    like.destroy
    redirect_to @post
  end
  private

  def create_follower(following_id, follower_id, accepted)
    Follower.create!(following_id:, follower_id:, accepted:)
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

  def find_post
    #@post = Post.find_by_id(params[:post_id])

    @post = Post.find(params[:post_id])
  end

  # def already_liked?
  #   Like.where(account_id: current_account.id, post_id:
  #   params[:post_id]).exists?
  # end
end
