class Game < ActiveRecord::Base
  has_many :games_users, class_name: "GameUser", dependent: :destroy
  has_many :players, through: :games_users

  class << self
    def not_in_group(group)
      game_ids = group.games.pluck(:id)
      where.not(id: game_ids)
    end
  end
end
