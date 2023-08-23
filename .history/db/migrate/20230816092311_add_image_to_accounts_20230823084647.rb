# frozen_string_literal: true

# This migration adds the `image`,`description`,`webiste` column to the accounts table.
class AddImageToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :description, :string
    add_column :accounts, :website, :string
  end
end
