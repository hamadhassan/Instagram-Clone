class CommentController < ApplicationController
  before_action :authenticate_account!

  def create
    @comment=Comment.new(comment_params)
  end

  pri
end
