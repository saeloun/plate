# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_user_is_admin_if_role_assigned_is_admin
    user = create(:super_admin_user)
    assert user.admin?
  end

  def test_user_is_not_admin_if_role_assigned_is_member
    user = create(:user)
    assert_not user.admin?
  end

  def test_should_return_first_name_and_last_name_as_name
    user_attributes = { email: Faker::Internet.email,
                        first_name: "Sam",
                        last_name: "Smith"
                      }

    user = create(:user, user_attributes)
    assert_equal "Sam Smith", user.name
  end

  def test_should_return_error_if_email_is_blank
    invalid_user = {
                     first_name: "Albert",
                     last_name: "Smith",
                     password: "welcome"
                   }

    user = User.new(invalid_user)

    assert_not user.valid?
    assert_equal ["can't be blank"], user.errors[:email]
  end

  def test_should_return_error_if_password_is_blank
    invalid_user = {
                     first_name: "Steve",
                     last_name: "Smith",
                     email: "steve@example.com"
                   }

    user = User.new(invalid_user)

    assert_not user.valid?
    assert_equal ["can't be blank"], user.errors[:password]
  end

  def test_should_return_error_if_password_is_too_short
    invalid_user = {
                     first_name: "Steve",
                     last_name: "Smith",
                     email: "steve@example.com",
                     password: "short"
                   }

    user = User.new(invalid_user)

    assert_not user.valid?
    assert_equal ["is too short (minimum is 6 characters)"], user.errors[:password]
  end

  def test_should_return_no_errors_if_user_details_are_valid
    valid_user = {
      first_name: "Steve",
      last_name: "Smith",
      email: "steve@example.com",
      password: "welcome"
    }

    user = User.new(valid_user)

    assert user.valid?
    assert_equal({}, user.errors.messages)
  end
end
