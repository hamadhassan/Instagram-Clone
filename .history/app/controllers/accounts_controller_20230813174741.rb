class AccountsController < ApplicationController
  before_action :authenticate_member!
  def index
    #user feed
  end
  def show
    #user profile
  end
end
