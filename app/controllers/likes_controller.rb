# frozen_string_literal: true

# This controller handles the management of likes.
class LikesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_post, only: %i[create destroy]  # Ensure @post is loaded for both actions
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(account_id: current_account.id)
    end
    redirect_back(fallback_location: post_path(@post))
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_back(fallback_location: post_path(@post))
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(account_id: current_account.id, post_id:
    params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
