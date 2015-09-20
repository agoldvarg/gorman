class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :week
      t.float   :spread
      t.integer :result

      t.timestamps null: false
    end
  end
end
