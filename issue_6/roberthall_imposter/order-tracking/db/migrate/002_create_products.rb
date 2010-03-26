class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.date :lst_order_dt
      t.date :est_reorder_dt
      t.integer :vendor_id
      t.string :size
      t.decimal :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
