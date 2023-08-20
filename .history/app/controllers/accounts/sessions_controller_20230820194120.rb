class Accounts::SessionsController < DeviseController
  def new
    if account_signed_in?
      redirect_to dashboard_path # Redirect to a different page if the user is already signed in
    
  end
end
