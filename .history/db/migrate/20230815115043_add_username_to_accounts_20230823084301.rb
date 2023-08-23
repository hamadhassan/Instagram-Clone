# frozen_string_literal: true

# This migration adds the `username`,`firs_name`, `last_name`  column to the accounts table.
class AddUsernameToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :name, :string, limit: 50
    add_column :accounts, :username, :string, limit: 20
  end
end
