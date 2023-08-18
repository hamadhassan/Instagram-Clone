class AddTotalLikesCount < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :total_likes_count, :integer
    add_column :posts, :total_comment_count, :integer
  end
end