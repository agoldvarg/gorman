namespace :db do
  desc "Seed the database with games scraped from ESPN"
  task :seed_game_data, [:week] => :environment do |t, args|
    week = args[:week]
    game_scraper = GameScraper.new(week)
    game_scraper.fetch_data
    game_scraper.build_games

    game_scraper.game_objects.each { |game_obj| Game.create(game_obj) }
  end

  desc "Assign CBS spreads to games"
  task :assign_spreads, [:week] => :environment do |t, args|
    week = args[:week]
    spread_scraper = SpreadScraper.new(week)
    spread_scraper.fetch_data
    spread_scraper.build_spreads
    spread_scraper.assign_spreads
  end
  
end
