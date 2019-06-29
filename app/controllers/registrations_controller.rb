# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
    end
end
