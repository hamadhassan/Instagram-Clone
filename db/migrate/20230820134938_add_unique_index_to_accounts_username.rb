# frozen_string_literal: true

class AddUniqueIndexToAccountsUsername < ActiveRecord::Migration[7.0]
  def change
    add_index :accounts, :username, unique: true
  end
end
