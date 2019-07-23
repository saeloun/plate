# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_honeybadger_context

  private
    def set_honeybadger_context
      Honeybadger.context(
        user_id: current_user&.id,
        user_email: current_user&.email,
        url: request.url
      )
    end
end
