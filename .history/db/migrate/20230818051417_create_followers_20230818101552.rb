class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :follower, references: :account
      t.references :following,
      t.timestamps
    end
  end
end
