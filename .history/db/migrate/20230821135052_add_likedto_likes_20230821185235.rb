class AddLikedtoLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :liked, :boll
    add_column :posts, :total_likes_count, :integer

  end
end
