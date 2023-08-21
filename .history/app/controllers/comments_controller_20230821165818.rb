# frozen_string_literal: true

# This controller handles the creation and management of comments.
class CommentsController < ApplicationController
  before_action :authenticate_account!
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authorize_comment, only: [:edit, :update, :destroy]


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post, notice: "Comment deleted successfully."
  end



  private
  def find_comment
      @comment = Comment.find(params[:id])
  end
  def authorize_comment
    unless current_user == @comment.user && current_user == @comment.post.user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  
  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
