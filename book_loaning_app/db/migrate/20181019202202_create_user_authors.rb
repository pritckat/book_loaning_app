class CreateUserAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_authors do |t|
      t.integer :user_id
      t.integer :author_id
      t.boolean :favorite

      t.timestamps
    end
  end
end
