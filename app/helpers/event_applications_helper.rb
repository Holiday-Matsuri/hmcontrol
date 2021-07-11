module EventApplicationsHelper
  def time_choice_enum(choice)
    case choice
    when 1
      content_tag(:span, "Can't Do", class: "badge bg-danger")
    when 2
      content_tag(:span, "Would rather not", class: "badge bg-warning")
    when 3
      content_tag(:span, "Don't Care", class: "badge bg-secondary")
    when 4
      content_tag(:span, "Can do", class: "badge bg-primary")
    else
      content_tag(:span, "Best Choice", class: "badge bg-success")
    end
  end
  
end
