# frozen_string_literal: true

class ContactsMailer < ApplicationMailer
  def notify_support_about_contact(contact)
    @contact = contact
    subject = "Contact us message from #{contact.email}"

    mail(to: Rails.application.secrets.support_email, from: contact.email,  subject: subject) do |format|
      format.html
    end
  end
end
