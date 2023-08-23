class PostsController < ApplicationController

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_parms)
    if post.save
      redirect_to dashoard_path,flash: {success:}
    else
    end
  end
  def show

  end

  private

  def post_parms
    params.require(:post).permit(:image, :image_cache)
  end

end
