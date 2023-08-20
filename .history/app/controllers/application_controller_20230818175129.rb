# frozen_string_literal: true
# This is the base controller that other controllers in the application will inherit from.

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username first_name last_name email password image description website])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name email password])
  end
end
