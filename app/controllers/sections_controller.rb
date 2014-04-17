class SectionsController < ApplicationController
  
  def show    
    @section = Section.includes(
      chapter:
        {
          prose_book: {
            prose_work: :author
            }
          }
    ).find(params[:id])
    
    @chapter = @section.chapter
    @prose_book = @chapter.prose_book
    @prose_work = @prose_book.prose_work
    @author = @prose_work.author
    
    render :show, layout: "reading"
  end

end
