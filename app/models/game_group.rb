class GameGroup < ActiveRecord::Base
  self.table_name = "games_groups"
  self.primary_keys = :group_id, :game_id

  belongs_to :group
  belongs_to :game
end
