class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.text :description
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
