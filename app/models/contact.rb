# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, :message, presence: true
end
