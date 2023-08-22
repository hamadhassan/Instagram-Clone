# frozen_string_literal: true

# This migration adds a unique index to the `username` column in the accounts table.
class AddUniqueIndexToAccountsUsername < ActiveRecord::Migration[7.0]
  def change
    add_index :accounts, :username, unique: true
  end
end
