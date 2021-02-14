# frozen_string_literal: true

class DashboardController < ApplicationController
  def home
    redirect_to(controller: "lists", action: "index")
    # render
  end

  def about
    render
  end
end
