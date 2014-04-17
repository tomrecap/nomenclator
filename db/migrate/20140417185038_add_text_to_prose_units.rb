class AddTextToProseUnits < ActiveRecord::Migration
  def up
    add_column :sections, :words, :text
    add_column :chapters, :words, :text
    add_column :prose_books, :words, :text
    add_column :prose_works, :words, :text
  end

  def down
    remove_column :sections, :words
    remove_column :chapters, :words
    remove_column :prose_books, :words
    remove_column :prose_works, :words
  end

end
