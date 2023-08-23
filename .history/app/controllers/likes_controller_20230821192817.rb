class LikesController < ApplicationController
  before_action :authenticate_user! # Assuming you have user authentication in place

  def like
    if request.post?
      toggle_like(true)
  end

  def dislike
    toggle_like(false)
  end

  private

  def toggle_like(liked)
    @post = Post.find(params[:post_id])
    @like = current_account.likes.find_or_initialize_by(post: @post)
    @like.liked = liked

    if @like.save
      redirect_to @post, notice: "Successfully #{liked ? 'liked' : 'disliked'} the post."
    else
      redirect_to @post, alert: "Failed to #{liked ? 'like' : 'dislike'} the post."
    end
  end
end
