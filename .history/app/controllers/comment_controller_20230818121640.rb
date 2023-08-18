class CommentController < ApplicationController
  before_action :authenticate_account!

  def create_table :table_name do |t|
    t.column_type :column_name
  
    t.timestamps
  end
  

end
