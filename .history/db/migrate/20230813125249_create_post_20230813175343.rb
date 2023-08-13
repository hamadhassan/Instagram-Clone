class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.references :taggable, polymorphic: { default: 'Photo' }
      t.timestamps
    end
  end
end
