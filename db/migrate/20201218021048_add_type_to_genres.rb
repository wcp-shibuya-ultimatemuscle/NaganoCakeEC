class AddTypeToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :type, :string
  end
end
