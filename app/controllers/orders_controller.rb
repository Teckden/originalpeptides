# coding: utf-8
class OrdersController < ApplicationController

  before_filter :confirm_logged_in, except: [:new, :create]

  layout 'admin', only: [:index, :show, :destroy]

  def index
    @orders = Order.all.reverse
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = current_cart
    if @cart.cart_products.empty?
      redirect_to store_url, norice: "Невозможно продолжить поскольку корзина пуста"
    end
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    @order.add_cart_products(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      #OrderMailer.new_order(@order).deliver
      redirect_to store_url, notice: "Ваш заказ добавлен в обработку, вскоре наш менеджер свяжется с Вами. Спасибо за покупку"
    else
      @cart = current_cart
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_url, notice: "Заказ успешно удален"
    else
      redirect_to orders_url, notice: "Ошибка, заказ не был удален"
    end
  end

end
