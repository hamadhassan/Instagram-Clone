class PostsController < ApplicationController
  # ...

  def edit
    unless current_user_can_edit_post?
      redirect_to root_path, alert: "You are not authorized to edit this post."
    end
  end

  def update
    unless current_user_can_edit_post?
      redirect_to root_path, alert: "You are not authorized to edit this post."
      return
    end

    current_images = @post.images
    if @post.update(post_params)
      # If the user uploaded new images, update the images
      if params[:post][:images].present?
        @post.images = Array.wrap(params[:post][:images])
      else
        @post.images = current_images
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

  def destroy
    unless current_user_can_edit_post?
      redirect_to root_path, alert: "You are not authorized to delete this post."
      return
    end

    @post.destroy
    redirect_to root_path, notice: "Post deleted successfully."
  end

  private

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def post_params
    params.require(:post).permit(:description, :private, images: [])
  end

  def current_user_can_edit_post?
    # Check if the currently signed-in account is the owner of the post
    @post.account_id == current_account.id
  end
end
