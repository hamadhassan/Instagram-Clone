# frozen_string_literal: true

class Comment < ApplicationRecord
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authorize_comment, only: [:edit, :update, :destroy]


  belongs_to :post
  belongs_to :account

  validates_presence_of :comment
  validates_presence_of :account_id
  validates_presence_of :post_id

  attr_accessor :return_to

  after_create :increase_post_comment_counter
  after_destroy :decrease_post_comment_counter

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

  def increase_post_comment_counter
    Post.find(post_id).increment(:total_comments_count).save
  end

  def decrease_post_comment_counter
    Post.find(post_id).decrement(:total_comments_count).save
  end
end
