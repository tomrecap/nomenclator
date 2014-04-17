class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :number
      t.integer :prose_book_id, null: false

      t.timestamps
    end
    
    add_index :chapters, :prose_book_id
  end
end
