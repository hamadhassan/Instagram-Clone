# frozen_string_literal: true

# This controller handles the creation and management of comments.
class CommentsController < ApplicationController
  before_action :authenticate_account!
  before_action :find_comment, only: %i[edit update destroy]
  before_action :authorize_comment, only: %i[edit update destroy]

  # rubocop:disable Metrics/AbcSize
  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id if account_signed_in?
    if save_comment_and_redirect
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : dashboard_path
      redirect_to return_url, flash: { success: 'Comment was created successfully!' }
    else
      redirect_to dashboard_path, flash: { danger: 'Comment was not saved!' }
    end
  end

  # rubocop:enable Metrics/AbcSize
  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment deleted successfully.'
    redirect_to request.referer
  end

  def edit
    @post = @comment.post
    respond_to do |format|
      format.js do
      end
    end
  end

  def update
    return unless @comment.update(comment_params)

    redirect_to @comment.post, notice: 'Comment updated successfully.'
  end

  private

  def save_comment_and_redirect
    if @comment.save
      true
    else
      false
    end
  end

  def authorize_comment
    return if current_account == @comment.account && current_account == @comment.post.account

    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
