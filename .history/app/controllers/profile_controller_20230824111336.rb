class ProfileController < ApplicationController
  def show
  end

  private 

  def set_account
    @account=Account.find(params[:id])
  end
end
