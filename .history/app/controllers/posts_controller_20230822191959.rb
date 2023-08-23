# frozen_string_literal: true

# This controller handles the management of post.
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
    else
      redirect_to new_post_path, flash: { success: 'Post was not saved!' }
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
    return if current_user_can_edit_post?

    @post.destroy
    redirect_to root_path, notice: 'Post deleted successfully.'
  end

  def edit; end

  def update
    return if current_user_can_edit_post?

    current_images = @post.images
    if @post.update(post_params)
      # If the user uploaded new images, update the images
      @post.images = if params[:post][:images].present?
                       Array.wrap(params[:post][:images])
                     else
                       current_images
                     end

      if @post.save
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        redirect_to root_path
      end
    else
      render 'edit'
    end
  end

  private

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
