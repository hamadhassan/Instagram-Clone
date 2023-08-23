# frozen_string_literal: true

# This migration adds the `private` column to the accounts table.
class AddPrivatetoAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :private, :boolean, default: true
  end
end
