class Cart < ActiveRecord::Base
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  before_save :sum_identical_products_if_any

  def sum_identical_products_if_any
    Cart.all.each do |cart|
      sums = cart.cart_products.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          cart.cart_products.where(product_id: product_id).delete_all
          cart.cart_products.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end

  def add_product(product_id)
    if current_item = cart_products.find_by_product_id(product_id)
      current_item.quantity += 1
    else
      current_item = cart_products.build(product_id: product_id)
      current_item.price = current_item.product.price
    end
    current_item
  end

  def total_price
    cart_products.to_a.sum { |item| item.total_price }
  end

end
