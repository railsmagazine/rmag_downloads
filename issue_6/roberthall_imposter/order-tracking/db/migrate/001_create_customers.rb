class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal
      t.string :contact
      t.string :primary_phone
      t.string :secondary_phone
      t.string :email_address
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
