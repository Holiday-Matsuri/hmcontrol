module ApplicationHelper
  def is_active?(path)
    if current_page?(path)
      "nav-link active"
    else
      "nav-link text-white"
    end
  end
end
