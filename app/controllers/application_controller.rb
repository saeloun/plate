# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_honeybadger_context

  private

    def set_honeybadger_context
      Honeybadger.context(
        user_id: current_user&.id,
        params: params.to_unsafe_hash,
        url: request.url
      )
    end
end
