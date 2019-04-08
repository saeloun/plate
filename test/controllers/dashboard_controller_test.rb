# frozen_string_literal: true

require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def test_home_success
    sign_in create(:super_admin_user)
    get "/"

    assert_response :success
  end

  def test_about_success
    get about_dashboard_index_url

    assert_response :success
  end
end
