module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title + ' - ' }
  end

  def font(font_url)
    content_for(:font) { font_url }
  end

end