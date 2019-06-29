# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    before_action :delete_password_if_blank, only: :update

    private
      # Method is overridden so that admin user can update details
      # of any existing user from admin dashboard
      # Check this link for reference
      # https://github.com/thoughtbot/administrate/issues/495#issuecomment-249566344
      def delete_password_if_blank
        if params[:user][:password].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
      end
  end
end
