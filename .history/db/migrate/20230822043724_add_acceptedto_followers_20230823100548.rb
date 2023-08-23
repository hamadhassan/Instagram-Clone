# frozen_string_literal: true

# This migration adds the `accepted` column to the followers table.
class AddAcceptedtoFollowers < ActiveRecord::Migration[7.0]
  def change
    add_column :followers, :accepted, :boolean, default: true
  end
end
