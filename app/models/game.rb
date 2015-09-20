class Game < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'

  def teams
    [away_team, home_team]
  end

  def matchup(long=false)
    if long
      "#{away_team.long_name} at #{home_team.long_name}"
    else
      "#{away_team.abbr} at #{home_team.abbr}"
    end
  end

end
