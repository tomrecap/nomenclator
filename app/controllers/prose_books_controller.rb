class ProseBooksController < ApplicationController

  def index
    @prose_books = ProseBook.all
  end
  
  def show
    @prose_book = ProseBook.includes(:chapters).find(params[:id])
    @chapters = @prose_book.chapters
  end

end
