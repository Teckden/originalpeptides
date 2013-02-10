class AddCustomUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :custom_url, :string
  end
end
