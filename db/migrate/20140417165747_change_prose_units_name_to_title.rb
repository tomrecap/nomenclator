class ChangeProseUnitsNameToTitle < ActiveRecord::Migration
  def change
    rename_column :prose_works, :name, :title
    rename_column :prose_books, :name, :title
    rename_column :chapters, :name, :title
    rename_column :sections, :name, :title
  end
end
