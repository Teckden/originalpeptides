# coding: utf-8
module ApplicationHelper

  def full_title(title)
    base_title = "Original Peptides - Только Качественная Продукция"
    title.blank? ? base_title : "#{title}"
  end

  def meta_keywords(page_identifier)
    if page_identifier == "store_show"
      Product.product_meta_keywords(params[:custom_url])
    else
      DefaultMetaTag.filter_tag_keywords(page_identifier)
    end
  end

  def meta_description(page_identifier)
    if page_identifier == "store_show"
      Product.product_meta_description(params[:custom_url])
    else
      DefaultMetaTag.filter_tag_description(page_identifier)
    end
  end

end
