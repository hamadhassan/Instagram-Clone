module PostsHelper

  def post_liked_by_user? post_id
    Like.where(post_id: post_id,account_id: cu)
  end
end