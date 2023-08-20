class Accounts::RegistrationsController < Devise::ApplicationController
  prepend_before_filter :require_no_authentication, only: [:cancel ]

end
