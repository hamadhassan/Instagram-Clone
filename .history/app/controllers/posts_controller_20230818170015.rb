class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_post, only: [:show]

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_params)
    @post.account_id=current_account.id if account_signed_in?
    if @post.save
      redirect_to dashboard_path,flash: {success: "Post was created successfully!"}
    else
      redirect_to new_post_path,flash: {success: "Post was not saved!"}
    end
  end
  def show
    @comment=Comment.new
    @comments=Comment.include(:accout).
  end

  private
  def set_post
    @post=Post.find(params[:id]) if params[:id].present?
  end
  def post_params
    params.require(:post).permit(:image,:description)
  end

end
