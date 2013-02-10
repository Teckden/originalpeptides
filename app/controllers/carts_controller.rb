# coding: utf-8
class CartsController < ApplicationController

  before_filter :confirm_logged_in, only: [:index]

  layout 'admin', only: [:index]

  def index
    @carts = Cart.all.reverse
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Попытка доступа к несуществующей корзине #{params[:id]}"
      redirect_to store_url, notice: "Несуществующая корзина"
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])
    @cart.save
    redirect_to(@cart, notice: 'Корзина создана')
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(params[:id])
      redirect_to @cart, notice: "Корзина обновлена"
    else
      render 'edit'
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to store_url
  end
end