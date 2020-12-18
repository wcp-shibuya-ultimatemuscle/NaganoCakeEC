class ChengeIsActiveOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :is_active, :boolean, default: '0'
  end

  def down
    change_column :genres, :is_active, :boolean
  end
end
