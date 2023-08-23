# frozen_string_literal: true

# This migration adds the `description` column to the posts table.
class AddDescriptionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :description, :text
  end
end
