# coding: utf-8
module ApplicationHelper

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

end
