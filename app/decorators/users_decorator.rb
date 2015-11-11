class UsersDecorator < Draper::CollectionDecorator
  delegate :in_groups_of
end
