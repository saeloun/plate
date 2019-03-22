# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authorize_admin

    def authorize_admin
      redirect_to "/", alert: "You are not authorized to perform this action!" unless current_user_is_admin?
    end

    private
      def current_user_is_admin?
        current_user.admin?
      end
  end
end
