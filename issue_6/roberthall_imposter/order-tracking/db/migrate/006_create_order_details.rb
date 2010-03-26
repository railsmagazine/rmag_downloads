class CreateOrderDetails < ActiveRecord::Migration
  def self.up
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty
      t.decimal :weight_lbs, :precision=>5, :scale=>3
      t.decimal :price, :precision=>6, :scale=>2

      t.timestamps
    end
  end

  def self.down
    drop_table :order_details
  end
end
