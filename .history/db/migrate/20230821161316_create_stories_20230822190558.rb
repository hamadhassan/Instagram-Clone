# frozen_string_literal: true

class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.references :account, null: false, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
