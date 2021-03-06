# coding: utf-8
class Product < ActiveRecord::Base
  has_many :cart_products
  has_many :assets, dependent: :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  attr_accessible :description, :price, :title, :available, :producer,
                        :assets_attributes, :custom_url, :meta_description, :meta_keywords, :russian_price

  before_destroy :ensure_not_referenced_by_any_cart_products

  validates :title, :description, :russian_price, :producer, :meta_description, :meta_keywords, presence: true
  validates :russian_price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :assets, presence: true
  validates :meta_description, :meta_keywords, uniqueness: true

  private

    def ensure_not_referenced_by_any_cart_products
      errors.add(:base, 'Product present in cart products') unless cart_products.empty?
    end

end
