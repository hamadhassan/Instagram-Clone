class LikesController < ApplicationController
  before_action :authenticate_account!
  def create
    @like=current_user
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
