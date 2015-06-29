class GameUser < ActiveRecord::Base
  self.tabe_name = "games_users"

  belongs_to :game
  belongs_to :player, class_name: "User"
end
