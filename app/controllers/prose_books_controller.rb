class ProseBooksController < ApplicationController

  def show
    @prose_book = ProseBook.includes(
      :chapters,
      { prose_work: :author }
    ).find(params[:id])
    @prose_work = @prose_book.prose_work
    @author = @prose_work.author
    @chapters = @prose_book.chapters
  end

end
