# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

    def confirm_logged_in
      unless session[:user_id]
        redirect_to store_url, notice: "Запрашиваемая страница не найдена"
        return false
      else
        return true
      end
    end


  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

end
