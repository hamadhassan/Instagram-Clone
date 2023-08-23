class LikesController < ApplicationController
  before_action :authenticate_account!

  before_action :find_post

  def create
    @post.likes.create(account_id: current_account.id)
    redirect_to post_path(@post)
  end
  private
  def find_post
    @post = Post.find(params[:post_id])
  end

end
