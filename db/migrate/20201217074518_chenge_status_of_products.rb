class ChengeStatusOfProducts < ActiveRecord::Migration[5.2]
 def up
    change_column :products, :status, :integer, default: 0
 end

 def down
    change_column :products, :status, :string
 end
end
