class PostsController < ApplicationController

  def new
    @post=
  end
  def create

  end
  def show

  end

  private

  def post_parms
    params.require(:post).permit(:image)
  end

end
