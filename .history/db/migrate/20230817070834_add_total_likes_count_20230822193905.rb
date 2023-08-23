# frozen_string_literal: true

# This migration adds the `total_likes_count` column to some table.
class AddTotalLikesCount < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :total_likes_count, :integer
    add_column :posts, :total_comments_count, :integer
  end
end
