class ChaptersController < ApplicationController
  
  def show
    @chapter = Chapter.includes(
      :sections,
      {
        prose_book: {
          prose_work: :author
          }
        }
    ).find(params[:id])
    
    @prose_book = @chapter.prose_book
    @prose_work = @prose_book.prose_work
    @author = @prose_work.author
    @sections = @chapter.sections.sort_by(&:number)
  end

end
