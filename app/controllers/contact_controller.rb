# frozen_string_literal: true

class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
  end
end
