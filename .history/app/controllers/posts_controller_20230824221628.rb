# frozen_string_literal: true

# This controller handles the management of posts.
class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_post, only: %i[show destroy edit update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id if account_signed_in?
    if @post.save
      redirect_to dashboard_path, flash: { success: 'Post was created successfully!' }
    end

  end

  def show
    @comment = Comment.new
    @comments = Comment.includes(:account).where(post_id: @post.id)
    @post = Post.find(params[:id])
    @likes = @post.likes.where(liked: true)
    @dislikes = @post.likes.where(liked: false)
  end

  def destroy
    return if current_user_cannot_edit_post?

    @post.destroy
    redirect_to root_path, notice: 'Post deleted successfully.'
  end

  def edit; end

  def update
    return if current_user_cannot_edit_post?
    puts params[:post]
    @description_changed = params[:post][:description][:private].present?
    @images_changed = params[:post][:images][:pr].present?
    puts "Only description is changed"
    @post.update(description: params[:post][:description])
  end

  private

  def update_post_images
    return unless params[:post][:images].present?

    @post.images = Array.wrap(params[:post][:images])
    @post.save
  end

  def current_user_cannot_edit_post?
    return false if @post.account_id == current_account.id

    redirect_to root_path, alert: 'You are not authorized to edit this post.'
    true
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def post_params
    params.require(:post).permit(:description, :private, images: [])
  end

  def current_user_can_edit_post?
    @post.account_id == current_account.id
  end
end
