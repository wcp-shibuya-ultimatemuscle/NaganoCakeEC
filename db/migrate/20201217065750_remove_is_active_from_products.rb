class RemoveIsActiveFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :is_active, :boolean
  end
end
