class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping
      t.integer :payment
      t.integer :sum
      t.integer :status

      t.timestamps
    end
  end
end
