class ChangeStatusOfOrderProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :order_products, :status, :integer, default: '0'
  end
  
  def down
    change_column :order_products, :status, :integer
  end 
end
