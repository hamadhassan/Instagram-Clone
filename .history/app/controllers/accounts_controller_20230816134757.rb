class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only[:shoprofilew]
  def index
    #user dashoard -postfeed
    @posts= Post.active
  end
  def profile
    #user profile

  end
  def set_account
    account= Account.find_by_username(parms[:username])
  end
end
