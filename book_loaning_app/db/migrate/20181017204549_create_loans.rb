class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :book_id
      t.boolean :returned
      t.datetime :return_datetime

      t.timestamps
    end
  end
end
