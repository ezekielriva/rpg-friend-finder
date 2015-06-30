class GroupUser < ActiveRecord::Base
  self.table_name = "groups_users"
  self.primary_keys = :group_id, :member_id

  belongs_to :group
  belongs_to :member, class_name: "User"
end
