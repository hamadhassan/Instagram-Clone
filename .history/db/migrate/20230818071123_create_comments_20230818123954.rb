class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :accounts
      t.string :comment
      t.timestamps
    end
  end
end
