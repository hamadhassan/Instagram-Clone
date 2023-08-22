# frozen_string_literal: true

# This migration creates the posts table.
class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.boolean :active
      t.references :account
      t.timestamps
    end
  end
end
