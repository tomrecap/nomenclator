module ApplicationHelper

  def render_for_reading(string)
    string_with_span_tags = "<span>" + string.split.join("</span> <span>") + "</span>"
    string_with_span_tags.html_safe
  end

end
