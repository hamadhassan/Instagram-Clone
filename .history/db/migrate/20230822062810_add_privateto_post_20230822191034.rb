# frozen_string_literal: true

class AddPrivatetoPost < ActiveRecord::Migration[7.0]
  def change
          # Define your other columns here

    add_column :posts, :private, :boolean
  end
end
