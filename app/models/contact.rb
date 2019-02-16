# frozen_string_literal: true

class Contact < ApplicationRecord
  after_create :send_notification_to_support

  def send_notification_to_support
    ContactsMailer.notify_support_about_contact(self).deliver_later
  end
end
