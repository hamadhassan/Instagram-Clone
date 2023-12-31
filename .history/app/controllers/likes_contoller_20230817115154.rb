class LikesController < ApplicationController
  before_action :authenticate_account!
  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)
    respond_to do |format|
      format.js {
        if Like.where(post_id: params[:post_id], account_id: current_account.id).any?
          # like already exists for post by this user 
        end
        if @like.save
          {success:true}
        else
          {success:false}
        end
      }
      end
  end

end
