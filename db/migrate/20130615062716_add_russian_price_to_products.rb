class AddRussianPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :russian_price, :decimal, precision: 8, scale: 2
  end
end
