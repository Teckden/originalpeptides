# coding: utf-8
class ProductsController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    3.times { @product.assets.build }
  end

  def edit
    @product = Product.find(params[:id])
    3.times { @product.assets.build }
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to @product, notice: 'Товар создан.'
    else
      3.times { @product.assets.build }
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Товар успешно обновлен.'
    else
      3.times { @product.assets.build }
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
end
