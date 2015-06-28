module ApplicationHelper
  def omniauth_authorize_path(resource_name, provider)
    send("#{resource_name}_omniauth_authorize_path", provider)
  end

  def show_link_label(label = "")
    [
      tag(:i, class: "fa fa-eye"),
      label
    ].join("").html_safe
  end

  def edit_link_label(label = "")
    [
      tag(:i, class: "fa fa-pencil"),
      label
    ].join("").html_safe
  end

  def delete_link_label(label = "")
    [
      tag(:i, class: "fa fa-trash text-danger"),
      label
    ].join("").html_safe
  end
end
