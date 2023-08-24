class ProfileController < ApplicationController
  before_action :set_account
  def show
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
