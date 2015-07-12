class Group < ActiveRecord::Base
  belongs_to  :owner,   class_name: "User"
  has_many    :members, through: :groups_users
  has_many    :groups_users, class_name: "GroupUser", dependent: :destroy
  has_many    :games_groups, class_name: "GameGroup", dependent: :destroy
  has_many    :games, through: :games_groups

  scope :by_name,  -> (name)    { where("#{self.table_name}.name LIKE ?", name) }
  scope :by_games, ->(game_ids) { joins(:games_groups).where(games_groups: { game_id: game_ids }) }

  geocoded_by      :encounter_point
  after_validation :geocode

  delegate :avatar, :name, to: :owner, prefix: true

  def members_no
    members.count
  end

  def as_json(options)
    {
      links: { self: "/groups/#{id}" },
      data: {
        name:      name,
        latitude:  latitude,
        longitude: longitude
      },
      meta: {}
    }
  end
end
