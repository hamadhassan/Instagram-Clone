class Accounts::RegistrationsController < ApplicationController
  prepend_before_filter :require_no_authentication, only: [:cancel ]
  def new
    if user_signed_in?
      redirect_to root_path # Redirect to a different page if the user is already signed in
    else
      super
    end
  end
end
