class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.all
  end
  
  def show
    @chapter = Chapter.includes(:sections).find(params[:id])
    @sections = @chapter.sections
  end

end
