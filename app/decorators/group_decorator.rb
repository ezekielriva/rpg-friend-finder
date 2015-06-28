class GroupDecorator < Draper::Decorator
  delegate_all

  decorates_association :owner
  decorates_association :members

  def display_name
    "#{object.name.titleize} Group"
  end

  alias_method :to_s, :display_name
end
