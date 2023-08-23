class CommentController < ApplicationController
  before_action :authenticate_account!

  def create
    @comment=Comment.new(comment_params)
    @comment.account_id= current_account.id if account_signed_in?
    if @comment.save
      redirect_to dashboard_path, flash:{success: "Comment was created successfully!"}
    else
      redirect_to dashboard_path, flash:{danger: "Post was not saved!"}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comments,:post_id)
  end
end
