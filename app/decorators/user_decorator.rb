class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :groups

  def display_name
    object.name.titleize
  end
  alias_method :to_s, :display_name

  def avatar
    if object.avatar.blank?
      "http://lorempixel.com/100/100/people/#{object.id}/#{display_name}"
    else
      object.avatar
    end
  end

end
