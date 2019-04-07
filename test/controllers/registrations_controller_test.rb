# frozen_string_literal: true

require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  def test_user_registration_success
    assert_difference("User.count") do
      post user_registration_url, params: {
                                            user: {
                                              email: "charles@example.com",
                                              first_name: "Charles",
                                              last_name: "Smith",
                                              password: "welcome"
                                            }
                                          }
    end

    assert_redirected_to root_path
  end

  def test_user_not_registered
    assert_no_difference("User.count") do
      post user_registration_url, params: {
                                            user: {
                                              email: "charles@example.com",
                                              first_name: "Charles",
                                              last_name: "Smith",
                                            }
                                          }
    end

    assert_response :success
  end
end
