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
    @title = "Доставка и оплата"
    @delivery_details = Page.find_by_page(params[:custom_url])
  end

end
