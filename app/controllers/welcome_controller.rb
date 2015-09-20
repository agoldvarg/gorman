class WelcomeController < ApplicationController

  def index
    @current_week = ENV["CURRENT_WEEK"]
    @games = Game.where(week: @current_week)
    @page_class = "welcome-page"
  end
end
