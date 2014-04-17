class ProseBooksController < ApplicationController

  def show
    @prose_book = ProseBook.includes(:chapters, :prose_work, :author).find(params[:id])
    @chapters = @prose_book.chapters
  end

end
