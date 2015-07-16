module ApplicationHelper
  def omniauth_authorize_path(resource_name, provider)
    send("#{resource_name}_omniauth_authorize_path", provider)
  end

  def fa_icon(icon_name, text: nil)
    [
      tag(:i, class: "fa fa-#{icon_name}"),
      text
    ].join("").html_safe
  end
end
