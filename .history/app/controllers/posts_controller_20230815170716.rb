class PostsController < ApplicationController

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_parms)
    @post.account_id=cureent_account.id if account_signed_in
    if post.save
      redirect_to dashoard_path,flash: {success: "Post was created successfully!"}
    else
      redirect_to new_post_path,flash: {success: "Post was not saved!"}
    end
  end
  def show

  end

  private

  def post_parms
    params.require(:post).permit(:image, :image_cache)
  end

end
