# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :email, uniqueness: true

  def admin?
    self.role == "admin"
  end

  def name
    "#{first_name} #{last_name}"
  end
end
