class PostsController < ApplicationController

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_parms)
    if post.save
  end
  def show

  end

  private

  def post_parms
    params.require(:post).permit(:image, :image_cache)
  end

end
