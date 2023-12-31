class CommentsController < ApplicationController
  before_action :authenticate_account!

  def create
    @comment=Comment.new(comment_params)
    @comment.account_id= current_account.id if account_signed_in?
    if @comment.save
      return_url=params[][:return_to].present? ? post_path(@post.id) :  dashboard_path
      redirect_to return_url, flash:{success: "Comment was created successfully!"}
    else
      redirect_to dashboard_path, flash:{danger: "Post was not saved!"}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:post_id,:return_to)
  end
end
