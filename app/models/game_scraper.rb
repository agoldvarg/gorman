require 'nokogiri'
require 'open-uri'

ESPN_URL = "http://espn.go.com/nfl/schedule"

class GameScraper

  attr_reader :game_objects

  def initialize
    @url = ESPN_URL
    @week = ENV["CURRENT_WEEK"]
    @game_objects = []
  end

  def fetch_data
    @data ||= Nokogiri::HTML(open(@url))
  end

  def games
    @data.css("tr.odd, tr.even")
  end

  def build_games
    games.each do |game|
      teams = parse_teams(game)
      away_team_abbr = teams.first.text
      home_team_abbr = teams.last.text

      if home_team_abbr == "WSH"
        home_team_abbr = "WAS"
      end
      if away_team_abbr == "WSH"
        away_team_abbr = "WAS"
      end

      if home_team_abbr == "JAX"
        home_team_abbr = "JAC"
      end
      if away_team_abbr == "JAX"
        away_team_abbr = "JAC"
      end

      away_team = Team.find_by!(abbr: away_team_abbr)
      home_team = Team.find_by!(abbr: home_team_abbr)

      @game_objects << {home_team: home_team, away_team: away_team, week: @week}
    end
  end

  def parse_teams(game_data)
    game_data.css("abbr")
  end

  def get_scores(game_data)
    game_data.css("a[name='&lpos=nfl:schedule:score']").text
  end
end
