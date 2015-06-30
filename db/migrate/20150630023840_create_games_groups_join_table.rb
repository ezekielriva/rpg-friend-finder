class CreateGamesGroupsJoinTable < ActiveRecord::Migration
  def change
    create_table :games_groups, id: false do |t|
      t.integer :game_id, index: true
      t.integer :group_id, index: true
    end

    add_index :games_groups, [:group_id, :game_id]
  end
end
