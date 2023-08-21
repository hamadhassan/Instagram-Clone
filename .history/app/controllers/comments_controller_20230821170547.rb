# frozen_string_literal: true

# This controller handles the creation and management of comments.
class CommentsController < ApplicationController
  before_action :authenticate_account!
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authorize_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id if account_signed_in?
    if @comment.save
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : dashboard_path
      redirect_to return_url, flash: { success: 'Comment was created successfully!' }
    else
      redirect_to dashboard_path, flash: { danger: 'Post was not saved!' }
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: "Comment deleted successfully."
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: "Comment updated successfully."
    else
      render 'edit'
    end
  end
  private

  def authorize_comment
    unless current_account == @comment.account && current_user == @comment.post.user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
