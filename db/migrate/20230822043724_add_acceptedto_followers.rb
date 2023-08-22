class AddAcceptedtoFollowers < ActiveRecord::Migration[7.0]
  def change
    add_column :followers, :accepted, :boolean
  end
end
