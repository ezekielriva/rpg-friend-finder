class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :groups

  def display_name
    object.name.titleize
  end
  alias_method :to_s, :display_name

end
