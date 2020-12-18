class ChengeNameOfGenres < ActiveRecord::Migration[5.2]
  def change
   def up
     change_column :genres, :type, :string, default: 0
   end

   def down
    change_column :genres, :name, :string
   end
  end
end
