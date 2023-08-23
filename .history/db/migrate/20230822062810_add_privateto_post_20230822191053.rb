# frozen_string_literal: true

class AddPrivatetoPost < ActiveRecord::Migration[7.0]
  def change
    # Add the private a
    add_column :posts, :private, :boolean
  end
end
