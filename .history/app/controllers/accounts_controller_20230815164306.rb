class AccountsController < ApplicationController
  before_action :authenticate_account!
  def index
    #user dashoard feed
    @posts= Post.actice
  end
  def show
    #user profile
  end
end
