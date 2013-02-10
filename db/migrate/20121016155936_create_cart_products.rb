class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.references :cart
      t.references :product
      t.integer :quantity, default: 1
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
    add_index :cart_products, ['cart_id', 'product_id']
  end
end
