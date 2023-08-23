class LikesController < ApplicationController
  before_action :authenticate_account!

  def save_like
    @like=Like.new(post_id: params[:post_id], account_id: current_account.id)
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
        @post_likes=Post.finder(@post_id).total_likes_count
        render "post/like"
      }
      end
  end
  GET http://127.0.0.1:3000/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--cc984cb0df886f16033256cd15ce28e18bf44823/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2QzNKbGMybDZaVWtpRERFd01IZ3hNREFHT3daVSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--e2355082e3edbfef8013f73839a4f40479cd5855/img-03.jpg 500 (Internal Server Error)
end
