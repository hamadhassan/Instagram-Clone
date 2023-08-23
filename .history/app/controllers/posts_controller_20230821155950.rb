# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_post, only: [:show, :destroy,:edit,:update]

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
    @comments = Comment.includes(:accout).where(post_id: @post.id)
  end
  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted successfully."
  end
  def edit

  end
  def update
    current_images = @post.images
    if @post.update(post_params)
      # If the user uploaded new images, update the images
      if params[:post][:images].present?
        @post.images = Array.wrap(params[:post][images])
      else
        # If no new images were uploaded, retain the current images
        @post.images = current_images
      end

      if @post.save
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render 'edit'
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
    params.require(:post).permit(:description,images: [])
  end
end
