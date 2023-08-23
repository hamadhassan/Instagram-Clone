# frozen_string_literal: true

# This migration adds the `liked` column to the likes table.
class AddLikedtoLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :liked, :boolean
  end
end
