class AddTotalLikesCount < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :total, :column_type, :column_options
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
