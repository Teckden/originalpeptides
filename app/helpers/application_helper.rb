# coding: utf-8
module ApplicationHelper

  def full_title(title)
    base_title = "Original Peptides - Только Качественная Продукция"
    title.blank? ? base_title : "#{title}"
  end

  def find_page(page)
    Page.get_custom_url(page)
  end

end
