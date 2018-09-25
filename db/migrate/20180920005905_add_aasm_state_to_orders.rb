class AddAasmStateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :aasm_state, :string, null: false, default: 'created'
  end
end
