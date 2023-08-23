class LikesController < ApplicationController
  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)
    if @like.save
      respond_to do |format|
        format.json {
          
        }
      end
      redirect_to dashboard_path,flash: {success: "Post was created successfully!"}
    else
      redirect_to new_post_path,flash: {success: "Post was not saved!"}
    end
  end

end
