class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal
      t.string :contact
      t.string :email_address
      t.string :timezone
      t.string :phone
      t.string :tollfree
      t.tinyint :active

      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
