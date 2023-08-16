class AddDescriptionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :website, :string

  end
end
