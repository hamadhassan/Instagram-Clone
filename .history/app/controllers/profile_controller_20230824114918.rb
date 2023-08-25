class ProfileController < ApplicationController
  before_action :set_account
  def show
  end
  def follow
    Relationship.create_or_find_by(fol)
  end

  def unfollow

  end

  private

  def set_account
    @account=Account.find(params[:id])
  end
end
