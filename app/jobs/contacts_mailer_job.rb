# frozen_string_literal: true

class ContactsMailerJob < ApplicationJob
  queue_as :default

  def perform(contact)
    ContactsMailer.notify_support_about_contact(@contact)
  end
end
