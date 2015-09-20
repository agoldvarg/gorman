require 'nokogiri'
require 'open-uri'

CBS_URL = "http://www.cbssports.com/nfl/features/writers/expert/picks"

class SpreadScraper

  attr_reader :spreads

  def initialize(week)
    @url = CBS_URL
    @week = ENV["CURRENT_WEEK"]
    @spreads = []
  end

  def fetch_data
    @data ||= Nokogiri::HTML(open(@url))
  end

  def games
    @data.css(".gameLineCtr")
  end

  def build_spreads
    games.each do |game|
      spread = game.css('#lineNumber').text.to_f
      home_team_abbr = game.css('#lineTeam').text

      home_team = Team.find_by!(abbr: home_team_abbr)

      spread_object = {spread: spread, home_team: home_team}
      @spreads << spread_object
    end
  end

  def assign_spreads
    @spreads.each do |game|
      game_instance = Game.find_by!(home_team: game[:home_team], week: @week)

      game_instance.update(spread: game[:spread])
    end
  end
end
