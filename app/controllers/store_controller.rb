# coding: utf-8
class StoreController < ApplicationController
  def index
    @products = Product.all.reverse
  end

  def show
    @product = Product.find(params[:id])
    @assets = @product.assets
  end

  def empty_cart
    redirect_to store_url, notice: "Корзина пуста"
  end

  def delivery_info
    @delivery_details = DeliveryDetail.all
  end

end
