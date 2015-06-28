module GroupsHelper
  def group_map_element(group)
    content_tag(:div, "", id: "group-map-canvas", data: {
      latitude:  group.latitude,
      longitude: group.longitude
    }).html_safe
  end
end
