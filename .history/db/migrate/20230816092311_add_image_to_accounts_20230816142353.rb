class AddImageToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts :image, :t.string
  end
end
