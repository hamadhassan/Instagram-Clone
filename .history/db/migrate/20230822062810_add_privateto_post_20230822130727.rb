class AddPrivatetoPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :private, :boolean

  end
  def update
end
