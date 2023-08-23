class AddAcceptedtoFollowers < ActiveRecord::Migration[7.0]
  def change
    add_column :followers, :private, :boolean

  end
end
