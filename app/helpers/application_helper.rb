# coding: utf-8
module ApplicationHelper

  def admin?
    #return false
    session[:user_id] ? true : false
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

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
