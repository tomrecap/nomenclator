class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :number
      t.integer :prose_book_id, null: false

      t.timestamps
    end
    
    add_index :sections, :prose_book_id
  end
end
