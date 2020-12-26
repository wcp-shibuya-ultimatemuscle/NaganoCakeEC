class RenameUserIdColumnToCarts < ActiveRecord::Migration[5.2]
  def change
    rename_column :carts, :user_id, :customer_id
  end
end
