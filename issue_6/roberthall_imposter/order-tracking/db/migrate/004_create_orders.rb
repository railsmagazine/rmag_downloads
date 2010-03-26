class CreateOrders < ActiveRecord::Migration
  def self.up    
      create_table :orders do |t|
	      t.integer :customer_id
	      t.date    :ship_dt
	      t.integer :shipper_id
	      t.text :notes

	      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
