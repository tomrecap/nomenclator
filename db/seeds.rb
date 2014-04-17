# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

authors = []
5.times { authors << Author.create!(name: Faker::Name.last_name) }

authors.each do |author|
  rand(2..4).times do |work_number|
    work = author.
      prose_works.
      create!(title: Faker::Lorem.words(2).join(" "))
    
    rand(3..6).times do |book_number|
      book = work.
        prose_books.
        create!(title: "Book #{book_number + 1}", number: (book_number + 1))
      
      rand(3..6).times do |chapter_number|
        chapter = book.
          chapters.
          create!(title: "Chapter #{chapter_number + 1}", number: (chapter_number + 1))
        
        rand(5..9).times do |section_number|
          section = chapter.
            sections.
            create!(number: (section_number + 1))
        end
      end
    end
  end
end