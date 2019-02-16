# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout "mailer"

  default from: Rails.application.secrets.mailer_default_from_email
end
