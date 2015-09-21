class PicksController < ApplicationController

  def new
    @current_week = ENV["CURRENT_WEEK"]
    @games = Game.where(week: @current_week)
    @page_class = "new-picks-page"
  end
end
