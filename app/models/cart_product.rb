class CartProduct < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity

  belongs_to :order
  belongs_to :cart
  belongs_to :product
  
  # It was made to show cart.product price but for some reason it wasnot working on production properly. 
  # Uncomenting this line broke nothing and seems to work well, but in case of future bugs I left it in the code
  #before_create { |cart_product| cart_product.price = cart_product.product.price }

  def total_price(currency)
    case currency
      when 'UAH'
        product.price * quantity
      when 'RUB'
        begin
          product.russian_price * quantity
        rescue
        end
    end
  end

end
