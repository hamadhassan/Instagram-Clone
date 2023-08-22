# frozen_string_literal: true

# This migration adds the `username` column to the accounts table.
class AddUsernameToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :first_name, :string, limit: 20
    add_column :accounts, :last_name, :string, limit: 20
    add_column :accounts, :username, :string, limit: 20
  end
end
