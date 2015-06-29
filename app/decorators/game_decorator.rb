class GameDecorator < Draper::Decorator
  delegate_all

  def display_name
    object.name.titleize
  end

  alias_method :to_s, :display_name
end
