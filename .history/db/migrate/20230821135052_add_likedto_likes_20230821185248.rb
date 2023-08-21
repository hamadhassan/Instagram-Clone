class AddLikedtoLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :liked, :boolean
  end
end
