class PostsController < ApplicationController

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_parms)
  end
  def show

  end

  private

  def post_parms
    params.require(:post).permit(:image, :image_ca)
  end

end
