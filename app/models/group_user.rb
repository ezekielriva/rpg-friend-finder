class GroupUser < ActiveRecord::Base
  self.table_name = "groups_users"

  belongs_to :group
  belongs_to :member, class_name: "User"
end
