class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :name
      t.string :email
      t.string :full_address
      t.string :cc_num
      t.string :phone
      t.string :make
      t.string :model
      t.string :milage
      t.decimal :price

      t.timestamps
    end
  end
end
