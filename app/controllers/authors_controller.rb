class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end
  
  def show
    @author = Author.includes(:prose_works).find(params[:id])
    @prose_works = @author.prose_works.sort_by(&:title)
  end

end
