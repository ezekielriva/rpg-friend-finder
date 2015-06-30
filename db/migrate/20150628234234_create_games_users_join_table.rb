class CreateGamesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :games_users, id: false do |t|
      t.integer :game_id, index: true
      t.integer :player_id, index: true
    end

    add_index :games_users, [:game_id, :player_id]
  end
end
