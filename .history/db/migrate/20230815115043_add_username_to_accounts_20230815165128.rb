class AddUsernameToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :first_name
  end
end
