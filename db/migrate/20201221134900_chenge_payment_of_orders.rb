class ChengePaymentOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment, :integer
  end
  def down
    change_column :orders, :payment, :integer, default: '0'
  end
end
