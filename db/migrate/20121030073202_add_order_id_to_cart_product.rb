class AddOrderIdToCartProduct < ActiveRecord::Migration
  def change
    add_column :cart_products, :order_id, :integer
  end
end
