module ApplicationHelper
  def status_badge_for(model, options = {})
    status_colors = {
      requested: "yellow",
      submitted: "yellow",
    }

    color = status_colors[model.status.to_sym]

    classes = [
      "status",
      "text-xs",
      "leading-tight",
      "tracking-wider",
      "uppercase",
      "px-1",
      "py-1",
      "rounded",
      "border",
      "border-#{color}-400",
      "text-#{color}-600",
      "bg-#{color}-100",
    ]
    classes << options.delete(:class)

    content_tag :span, model.status.titleize, class: classes.join(' ')
  end
end
