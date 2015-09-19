class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :week
      t.integer :spread
      t.integer :result

      t.timestamps null: false
    end
  end
end
