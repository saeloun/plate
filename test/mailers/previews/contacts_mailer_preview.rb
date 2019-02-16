# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/contacts_mailer
class ContactsMailerPreview < ActionMailer::Preview
  def notify_support_about_contact
    ContactsMailer.notify_support_about_contact(Contact.new(name: "Sam Smith",
                                                            email: "sam@example.com",
                                                            message: "Nice message"))
  end
end
