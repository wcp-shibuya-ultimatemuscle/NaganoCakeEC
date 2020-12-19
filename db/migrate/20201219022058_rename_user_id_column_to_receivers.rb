class RenameUserIdColumnToReceivers < ActiveRecord::Migration[5.2]
  def change
    rename_column :receivers, :user_id, :customer_id
  end
end
