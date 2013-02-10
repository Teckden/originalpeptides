# coding: utf-8
class CartProductsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @cart_product = @cart.add_product(product.id)

    if @cart_product.save
      redirect_to store_path, notice: "Товар добавлен в Вашу #{view_context.link_to('корзину', @cart)}.".html_safe
    else
      redirect_to store_url, notice: "Возникла ошибка, товар не добавлен в Вашу корзину"
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])

    if @cart_product.update_attributes(params[:cart_product])
      redirect_to current_cart, notice: 'Товар пересчитан.'
    else
      redirect_to current_cart, notice: "Не удалось обновить товар в корзине"
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    
    if @cart_product.destroy
      redirect_to current_cart, notice: "Товар удален из корзины"
    else
      redirect_to current_cart, notice: "Возникла ошибка, товар не был удален из корзины"
    end
  end
end
