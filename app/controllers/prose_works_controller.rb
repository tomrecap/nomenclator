class ProseWorksController < ApplicationController

  def index
    @prose_works = ProseWork.all
  end
  
  def show
    @prose_work = ProseWork.includes(:prose_books).find(params[:id])
    @prose_books = @prose_work.prose_books
  end

end
