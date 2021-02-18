# frozen_string_literal: true

class DashboardController < ApplicationController
  def home
    render
    # redirect_to(controller: "contacts", action: "demo")
    # render :template => 'api/v1/todos/demo'
  end

  def about
    render
  end
end
