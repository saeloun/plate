# frozen_string_literal: true

require "test_helper"

class ContactTest < ActiveSupport::TestCase
  def test_should_return_error_if_email_is_blank
    invalid_contact = {
                        name: "Charles Smith",
                        message: "I am not able to signup"
                      }

    contact = Contact.new(invalid_contact)

    assert_not contact.valid?
    assert_equal ["can't be blank"], contact.errors[:email]
  end

  def test_should_return_error_if_message_is_blank
    invalid_contact = {
                        name: "Charles Smith",
                        email: "charles@welcome.com"
    }

    contact = Contact.new(invalid_contact)

    assert_not contact.valid?
    assert_equal ["can't be blank"], contact.errors[:message]
  end

  def test_should_return_no_error_if_contact_details_are_valid
    invalid_contact = {
                        name: "Charles Smith",
                        email: "charles@welcome.com",
                        message: "I am not able to signup"
    }

    contact = Contact.new(invalid_contact)

    assert contact.valid?
    assert_equal({}, contact.errors.messages)
  end
end
