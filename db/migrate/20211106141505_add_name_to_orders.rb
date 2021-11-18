class AddNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string, null: false, default: ""
  end
end
