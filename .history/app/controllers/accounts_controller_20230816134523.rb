class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_po
  def index
    #user dashoard -postfeed
    @posts= Post.active
  end
  def show
    #user profile
  end
end
