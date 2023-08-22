class AddPrivatetoPost < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :private, :boolean

  end
end
