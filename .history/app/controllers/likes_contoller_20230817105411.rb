class LikesController < ApplicationController
  before_action :authenticate_account!
  def create
    @like=current_user.likes.new(like_params)
    @post_id=params[:post_id]
    respond_to do |format|
      format.js {
        if @like.save
          @success=true
        else
          @success=false
        end
        render "posts/like"
      }
      end
  end

end
