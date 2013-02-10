class CreateDeliveryDetails < ActiveRecord::Migration
  def change
    create_table :delivery_details do |t|
      t.text :delivery

      t.timestamps
    end
  end
end
