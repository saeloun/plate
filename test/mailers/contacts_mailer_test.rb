# frozen_string_literal: true

require "test_helper"

class ContactsMailerTest < ActionMailer::TestCase
  def test_notify_support_about_contact
    contact = create(:contact, email: "charles@example.com")

    email = ContactsMailer.notify_support_about_contact(contact)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["charles@example.com"], email.from
    assert_equal ["support@plate.com"], email.to
    assert_equal "Contact us message from charles@example.com", email.subject
  end
end
