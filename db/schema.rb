# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140417165747) do

  create_table "authors", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "prose_book_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "chapters", ["prose_book_id"], :name => "index_chapters_on_prose_book_id"

  create_table "prose_books", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "prose_work_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "prose_books", ["prose_work_id"], :name => "index_prose_books_on_prose_work_id"

  create_table "prose_works", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "author_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prose_works", ["author_id"], :name => "index_prose_works_on_author_id"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "chapter_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sections", ["chapter_id"], :name => "index_sections_on_chapter_id"

end
