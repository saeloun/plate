# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactsMailerJob.perform_later(@contact)
      redirect_to root_path, notice: "Thanks! We will get back soon."
    else
      redirect_to new_contact_path, notice: "Error creating a Message"
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
