class LikesController < ApplicationController
  def save_like
    @post=Post.new(post_parms)
    @post.account_id=current_account.id if account_signed_in?
    if @post.save
      redirect_to dashboard_path,flash: {success: "Post was created successfully!"}
    else
      redirect_to new_post_path,flash: {success: "Post was not saved!"}
    end
  end

end
