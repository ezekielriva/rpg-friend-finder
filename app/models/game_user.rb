class GameUser < ActiveRecord::Base
  self.table_name = "games_users"
  self.primary_keys = :game_id, :player_id

  belongs_to :game
  belongs_to :player, class_name: "User"
end
