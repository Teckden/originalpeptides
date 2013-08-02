module SessionsHelper

  def admin?
    session[:user_id] ? true : false
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def blog_admin?
    session[:blog_admin] && session[:user_id]
  end

end
