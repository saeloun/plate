# frozen_string_literal: true

require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  def test_new_action
    get new_contact_url

    assert_response :success
  end

  def test_create_success
    contact_params = {
                       contact: {
                         email: "charles@welcome.com",
                         name: "Charles Smith",
                         message: "I am not able to signup"
                       }
                     }

    post contacts_url, params: contact_params

    assert_redirected_to root_path
    assert_equal "Thanks! We will get back soon.", flash[:notice]
  end

  def test_create_failure
    contact_params = {
                       contact: {
                         name: "Charles Smith",
                         message: "I am not able to signup"
                       }
                     }

    post contacts_url, params: contact_params

    assert_redirected_to new_contact_path
    assert_equal "Error creating a Message", flash[:notice]
  end
end
