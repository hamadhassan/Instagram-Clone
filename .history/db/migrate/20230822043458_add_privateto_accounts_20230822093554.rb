class AddPrivatetoAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :liked, :boolean
  end
end
