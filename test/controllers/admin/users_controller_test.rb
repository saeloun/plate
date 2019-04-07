# frozen_string_literal: true

require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users :admin
  end

  def test_update_user_without_password
    user = users :albert
    update_user_params = {
                           user: {
                             email: "albert@example.com",
                             first_name: "Albert name change",
                             last_name: "Smith"
                           }
                         }

    put admin_user_url user.id, params: update_user_params

    assert_equal "User was successfully updated.", flash[:notice]
  end
end
