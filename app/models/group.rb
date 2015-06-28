class Group < ActiveRecord::Base
  belongs_to  :owner,   class_name: "User"
  has_many    :members, through: :groups_users
  has_many    :groups_users, class_name: "GroupUser", dependent: :destroy

  geocoded_by      :encounter_point
  after_validation :geocode

  delegate :avatar, :name, to: :owner, prefix: true

  def members_no
    members.count
  end
end
