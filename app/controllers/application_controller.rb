# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_meta_tags


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

  def init_meta_tags
    @meta_tags = {}
  end

  def find_default_meta_tags
    @meta_tags[:keywords] = DefaultMetaTag.find_by_method(controller_name + "_" + action_name).meta_keywords
    @meta_tags[:description] = DefaultMetaTag.find_by_method(controller_name + "_" + action_name).meta_description
  end

end
