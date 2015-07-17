class Game < ActiveRecord::Base
  has_many :games_users, class_name: "GameUser", dependent: :destroy
  has_many :players, through: :games_users

  default_scope { published }

  enum status: [:unpublished, :published]

  class << self
    def not_in_group(group)
      game_ids = group.games.pluck(:id)
      where.not(id: game_ids)
    end

    def in_groups
      game_ids = GameGroup.select(:game_id).uniq.pluck(:game_id)
      where(id: game_ids)
    end

    def not_played(user)
      game_ids = user.games.pluck(:id)
      where.not(id: game_ids)
    end
  end
end
