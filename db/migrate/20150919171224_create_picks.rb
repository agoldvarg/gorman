class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user, index: true
      t.integer :game_id
      t.integer :team_id
      t.boolean :bonus, default: false
      t.integer :rank

      t.timestamps null: false
    end
    add_foreign_key :picks, :users
  end
end
