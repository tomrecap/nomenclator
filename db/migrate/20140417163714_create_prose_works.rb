class CreateProseWorks < ActiveRecord::Migration
  def change
    create_table :prose_works do |t|
      t.string :name, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
    
    add_index :prose_works, :author_id
  end
end
