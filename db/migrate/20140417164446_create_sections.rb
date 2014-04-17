class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :number
      t.integer :chapter_id, null: false

      t.timestamps
    end
    
    add_index :sections, :chapter_id
  end
end
