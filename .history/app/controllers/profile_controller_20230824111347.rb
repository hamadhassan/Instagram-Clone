class ProfileController < ApplicationController
  before_action :method
  def show
  end

  private

  def set_account
    @account=Account.find(params[:id])
  end
end
