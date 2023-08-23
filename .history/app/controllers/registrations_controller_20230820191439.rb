class Accounts::RegistrationsController < Devise::RegistrationsController
  super
  prepend_before_filter :require_no_authentication, only: [:cancel ]
end
