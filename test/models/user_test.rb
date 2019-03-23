# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_user_is_admin_if_role_assigned_is_admin
    user = users :admin
    assert user.admin?
  end

  def test_user_is_not_admin_if_role_assigned_is_member
    user = users :albert
    assert_not user.admin?
  end

  def test_should_return_first_name_and_last_name_as_name
    user = users :albert
    assert_equal "Albert Smith", user.name
  end
end
