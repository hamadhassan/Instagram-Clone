class AccountsController < ApplicationController
  before_action :authenticate_account!
  def index
    #user dashoard -postfeed
    @posts= Post.active
  end
  def show
    #user profile
  end
end
