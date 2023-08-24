class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following
      t.boolean :accepteddefault: true

      t.timestamps
    end
  end
end
