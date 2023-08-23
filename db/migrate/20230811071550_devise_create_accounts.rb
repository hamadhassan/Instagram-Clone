# frozen_string_literal: true

# This migration creates the accounts table and adds Devise columns for authentication.
class DeviseCreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      add_recoverable_columns(t)

      ## Rememberable
      add_rememberable_columns(t)

      ## Trackable
      add_trackable_columns(t)

      ## Confirmable
      # add_confirmable_columns(t)

      ## Lockable
      # add_lockable_columns(t)

      t.timestamps null: false
    end

    add_index :accounts, :email, unique: true
    add_index :accounts, :reset_password_token, unique: true
    # add_index :accounts, :confirmation_token, unique: true
    # add_index :accounts, :unlock_token, unique: true
  end

  private

  def add_recoverable_columns(table)
    table.string :reset_password_token
    table.datetime :reset_password_sent_at
  end

  def add_rememberable_columns(table)
    table.datetime :remember_created_at
  end

  def add_trackable_columns(table)
    table.integer :sign_in_count, default: 0, null: false
    table.datetime :current_sign_in_at
    table.datetime :last_sign_in_at
    table.string :current_sign_in_ip
    table.string :last_sign_in_ip
  end

  # Add methods for Confirmable and Lockable if needed
end
