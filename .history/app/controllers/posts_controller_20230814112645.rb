class PostsController < ApplicationController

  def new

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
