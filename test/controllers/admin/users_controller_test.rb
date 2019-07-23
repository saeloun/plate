# frozen_string_literal: true

require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in create(:super_admin_user)
  end

  def test_update_user_without_password
    user = create(:user)
    update_user_params = {
                           user: {
                             email: Faker::Internet.email,
                             first_name: "Sam name change",
                             last_name: "Smith"
                           }
                         }

    put admin_user_url user.id, params: update_user_params

    assert_equal "User was successfully updated.", flash[:notice]
  end
end
