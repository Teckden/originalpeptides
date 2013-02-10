class Order < ActiveRecord::Base
  attr_accessible :name, :address, :email, :phone, :comment, :details

  has_many :cart_products, dependent: :destroy

  validates :name, :address, :email, :phone, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: EMAIL_REGEX }

  def add_cart_products(cart)
    cart.cart_products.each do |item|
      item.cart_id = nil
      cart_products << item
    end
  end
end
