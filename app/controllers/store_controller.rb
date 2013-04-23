# coding: utf-8
class StoreController < ApplicationController
  def index
    @products = Product.all.reverse
  end

  def show
    @product = Product.find_by_custom_url(params[:custom_url])
    @assets = @product.assets
    @title = @product.title
    @meta_description = @product.meta_description
    @meta_keywords = @product.meta_keywords
  end

  def empty_cart
    redirect_to store_url, notice: "Корзина пуста"
  end

  def delivery_info
    @title = "Доставка и оплата"
    @delivery_details = DeliveryDetail.all
  end

end
