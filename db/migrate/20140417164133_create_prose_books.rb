class CreateProseBooks < ActiveRecord::Migration
  def change
    create_table :prose_books do |t|
      t.string :name
      t.integer :number
      t.integer :prose_work_id, null: false

      t.timestamps
    end
    
    add_index :prose_books, :prose_work_id
  end
end
