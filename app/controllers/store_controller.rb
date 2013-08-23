# coding: utf-8
class StoreController < ApplicationController
  before_filter :find_default_meta_tags, only: [:index, :delivery_info]

  def index
    @products = Product.all.reverse
  end

  def show
    @product = Product.find_by_custom_url(params[:custom_url])
    @assets = @product.assets
    @title = @product.title
    @meta_tags[:keywords] = @product.meta_keywords
    @meta_tags[:description] = @product.meta_description
  end

  def empty_cart
    redirect_to store_url, notice: "Корзина пуста"
  end

  def delivery_info
    @delivery_details = Page.find_by_custom_url(params[:custom_url])
    @title = @delivery_details.title
  end

  def wholesale_prices
    @wholesale_prices = Page.find_by_custom_url(params[:custom_url])
    @title = @wholesale_prices.title
  end

end
