class LikesController < ApplicationController
  before_action :authenticate_account!
  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post_id=
    respond_to do |format|
      format.js {
        if existing_like.any?
          # like already exists for post by this user
          @success=false
        elsif @like.save
          @success=true
        else
          @success=false
        end
        render "post/like"
      }
      end
  end

end
