class LikesController < ApplicationController
  before_action :authenticate_account!

  def save_like
    @like=Like.new( post_id: params[:post_id], account_id: current_account.id)
    @post_id=params[:post_id]
    existing_like=Like.where(post_id: params[:post_id], account_id: current_account.id)
    respond_to do |format|
      format.js {
        if existing_like.any?
          # like already exists for post by this user
          existing_like.first.destroy
          @success=false
        elsif @like.save
          @success=true
        else
          @success=false
        end
        @post_likes=Post.find(@post_id).total_likes_count
        render "post/like"
      }
      end
  end
  # def save_like
  #   post_id = params[:post_id]
  #   @like = Like.find_or_initialize_by(post_id: post_id, account_id: current_account.id)

  #   respond_to do |format|
  #     format.js {
  #       if @like.persisted?
  #         # Like already exists for post by this user, so destroy it
  #         @like.destroy
  #         @success = false
  #       elsif @like.save
  #         @success = true
  #       else
  #         @success = false
  #       end

  #       @post_likes = Post.find(post_id).total_likes_count
  #       render "post/like"
  #     }
  #   end
  # end

end
