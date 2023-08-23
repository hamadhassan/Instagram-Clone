# frozen_string_literal: true

# This is the base controller that other controllers in the application will inherit from.
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username full_name last_name email password image description website
                                               private])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name email password])
  end

  def after_sign_in_path_for(resource)
    # Customize the redirect path here based on the resource (e.g., user, admin)
    if resource.is_a?(Account)
      dashboard_path
    else
      # Handle other types of users if needed
      root_path
    end
  end
end
