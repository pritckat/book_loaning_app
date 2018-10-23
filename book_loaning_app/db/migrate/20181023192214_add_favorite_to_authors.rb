class AddFavoriteToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :favorite, :boolean
  end
end
