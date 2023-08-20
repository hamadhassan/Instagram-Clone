class AddUniqueIndexToAccountsUsername < ActiveRecord::Migration[7.0]
  def change
    add_index :aCCos, :username, unique: true

  end
end
