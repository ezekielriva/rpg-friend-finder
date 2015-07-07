module GroupsHelper
  def group_map_element(group)
    content_tag(:div, "", id: "group-map-canvas", data: {
      latitude:  group.latitude,
      longitude: group.longitude,
      "marker-image" => image_url("poker.png")
    }).html_safe
  end
end
