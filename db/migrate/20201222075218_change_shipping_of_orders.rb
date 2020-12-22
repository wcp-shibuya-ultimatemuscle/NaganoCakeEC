class ChangeShippingOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :shipping, :integer, default: 800
  end

  def down
    change_column :orders, :shipping, :integer
  end
end
