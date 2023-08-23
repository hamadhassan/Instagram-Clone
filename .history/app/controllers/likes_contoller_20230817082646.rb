class LikesController < ApplicationController
  before_action :authenticate_account!
  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post_id=params[:post_id]
    respond_to do |format|
      format.json {
        if @like.save
          @
          render "posts/like"
        else
          {success:false}
        end
      }
      end
  end

end
