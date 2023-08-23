class LikesController < ApplicationController
  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)

      respond_to do |format|
        format.json {
          if @like.save
            redirect_to dashboard_path,flash: {success: "Post was created successfully!"}
          else
            
          end
        }
      end
  end

end
