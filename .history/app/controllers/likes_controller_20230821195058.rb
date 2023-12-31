class LikesController < ApplicationController
  before_action :authenticate_account!

  before_action :find_post

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(account_id: current_account.id)
    end
    redirect_to post_path(@post)
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end


end
