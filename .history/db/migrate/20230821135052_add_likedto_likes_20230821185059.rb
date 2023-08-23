class AddLikedtoLikes < ActiveRecord::Migration[7.0]
  def change
    t.references :account, null: false, foreign_key: true
    t.references :post, null: false, foreign_key: true
    t.boolean :liked

  end
end
