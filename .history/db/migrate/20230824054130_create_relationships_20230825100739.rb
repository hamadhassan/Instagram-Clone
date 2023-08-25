# frozen_string_literal: true

# This migration adds the `follow following accepted` column to the relationships table.
class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id
      t.boolean :accepted, default: true

      t.timestamps
    end
  end
end
