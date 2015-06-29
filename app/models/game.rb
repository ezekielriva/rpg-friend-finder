class Game < ActiveRecord::Base
  has_many :games_users, class_name: "GameUser", dependent: :destroy
  has_many :players, through: :games_users
end
