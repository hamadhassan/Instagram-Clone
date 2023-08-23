class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :accounts, polymorphic: { default: 'Photo' }
      t.timestamps
    end
  end
end
